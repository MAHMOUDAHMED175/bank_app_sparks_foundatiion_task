

import 'dart:io';
import 'dart:async';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:fiels/component/cubit/cubit.dart';
import 'package:fiels/component/cubit/db_helper.dart';
import 'package:fiels/component/cubit/states.dart';
import 'package:fiels/component/utility.dart';
import 'package:fiels/model/image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

class NewTasks extends StatefulWidget {
  @override
  State<NewTasks> createState() => _NewTasksState();
}

class _NewTasksState extends State<NewTasks> {
  Future<XFile>? imageFile;
  Image? image;
  DBHelper? dbHelper;
  List<Photo>? images;

  @override
  void initState() {
    super.initState();
    images=[];
    dbHelper=DBHelper();
  }

  refreshImages(){
    dbHelper!.getPhotos().then((imgs) {
      setState(() {
        images!.clear();
        images!.addAll(imgs);
      });
    });
  }



  pickImageFromGallery(){
    ImagePicker.platform.pickImage(source: ImageSource.gallery).then((imgFile) {
      String imgString= Utility.base64String( File(imgFile!.path).readAsBytesSync()) ;
      Photo photo=Photo(id: 0,photoName: imgString);
      dbHelper!.save(photo);
      refreshImages();

    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FilesCubit,FilesStates>(
      listener: (context,state){},
      builder: (context,state){
        var newTask=FilesCubit.get(context).newTasks;

        return  tasksBuilder(
            tasks: newTask,
            color: Colors.grey,
            icon: Icons.menu,
            text:'<<<<=== No Files ===>>>>');
      },
    ) ;
  }

  Widget tasksBuilder(
      {
        required String text,
        required IconData icon,
        required Color color,
        required List<Map> tasks,
      })=>ConditionalBuilder(
    condition: tasks.length>0,
    builder: (context)=>ListView.separated(
      itemBuilder:(context,index)=>buildItem(tasks[index],context,),
      separatorBuilder: (context,index)=>Padding(
        padding: const EdgeInsets.only(left: 20.0),
        child: Container(
          height: 1.0,
          color: Colors.grey,

        ),
      ),
      itemCount:tasks.length,
    ),
    fallback: (context)=>Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children:  [

          IconButton(onPressed: (){
            pickImageFromGallery();
          }, icon: Icon(Icons.add)),

        Flexible(
          child: GridView.count(
            crossAxisCount: 2,
              childAspectRatio: 1.0,
              mainAxisSpacing: 4.0,
            crossAxisSpacing: 4.0,
            children: images!.map((photo) {
              return Utility.imageFromBase64String(photo.photoName!);
            }).toList(),


          ),
        ),
          Icon(
            icon,
            color:color,
            size: 50.0,
          ),
          Text(
            'No Files Founded ya abo ali',
            style: TextStyle(
                fontSize: 20
            ),
          ),
        ],
      ),
    ),
  );

  Widget buildItem(Map item,context)=>Padding(
    padding: const EdgeInsets.all(20.0),
    child: Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(35.0),
          topRight: Radius.circular(35.0),
          bottomLeft: Radius.circular(35.0),
          //bottomRight: Radius.circular(20.0),
        ),
        color: Colors.white,
      ),
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child:Row(
          children: [

            // GridView.count(crossAxisCount: 2,
            //
            //     childAspectRatio: 1.0,
            //     mainAxisSpacing: 4.0,
            //   crossAxisSpacing: 4.0,
            //   children: images!.map((photo) {
            //     return Utility.imageFromBase64String(photo.photoName!);
            //   }).toList(),
            //
            //
            // ),
            Stack(
              alignment: Alignment.bottomRight,
              children: [
                CircleAvatar(
                    radius: 40,
                    backgroundColor: Theme.of(context).scaffoldBackgroundColor,

                  backgroundImage: AssetImage('assets/images/m.png'),
                ),

                CircleAvatar(
                    radius: 18,
                    backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                    child: IconButton(
                        onPressed: (){
                          pickImageFromGallery();
                        },
                        icon: Icon(Icons.camera_alt_outlined))
                ),
              ],
            ),
            SizedBox(

              width:12.5,

            ),
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,

                //crossAxisAlignment: CrossAxisAlignment.start,

                children: [
                  Text("${item['title']}",
                      maxLines: 2,
                      textWidthBasis: TextWidthBasis.longestLine,
                      style:TextStyle(
                        fontSize: 18.0,
                        overflow: TextOverflow.ellipsis,
                        color: Colors.black,
                      )
                  ),
                  Text("${item['date']??''}",

                      style:TextStyle(

                        color: Colors.grey,

                      )

                  ),

                ],

              ),
            ),
            SizedBox(

              width:5.5,

            ),
            IconButton(
              onPressed: (){
                FilesCubit.get(context).DeleteData(item['id']);
              },
              icon: const Icon(Icons.delete,color: Colors.red,),
            ),
          ],

        ),
      ),
    ),
  );
}
