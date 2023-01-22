import 'package:fiels/component/component.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class PdfViewer extends StatefulWidget {
  const PdfViewer({Key? key}) : super(key: key);

  @override
  State<PdfViewer> createState() => _PdfViewerState();
}

class _PdfViewerState extends State<PdfViewer> {
  PdfViewerController pdfViewerController=PdfViewerController();
  double zoom=0.0;
  int? pageNumber;

  jumpTo(BuildContext context){
    showDialog(context: context,
        builder:(context){
      return AlertDialog(
        title: Text('Enter the page do you want'),
        content: TextFormField(
          keyboardType:TextInputType.number,

          decoration:InputDecoration(
            labelText: 'Number of page',
            prefixIcon: Icon(Icons.numbers)
          ),
          onChanged: (val){
            pageNumber=int.parse(val);
          }


        ),
        actions: [

          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red
            ),
            onPressed: (){
            Navigator.pop(context);
          }, child:Text('Cancel'),
          ),

          SizedBox(width: 20.0,),
          ElevatedButton(style: ElevatedButton.styleFrom(
              backgroundColor: Colors.green
          ),onPressed: (){
            pdfViewerController.jumpToPage(pageNumber!);
            Navigator.pop(context);
          }, child:Text('OK'), ),
        ],
      );
        } ,
    );

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //ll
        backgroundColor:Colors.grey[400],

        title:Text('pdf Viewer',
        style: TextStyle(
          color: Colors.black,
        ),),
        actions: [
          IconButton(onPressed: (){
            pdfViewerController.previousPage();

          }, icon: Icon(Icons.arrow_back_ios,color: Colors.black,)),
          IconButton(onPressed: (){
            pdfViewerController.nextPage();

          }, icon: Icon(Icons.arrow_forward_ios_outlined,color: Colors.black,)),
          IconButton(onPressed: (){
            jumpTo(context);
          }, icon: Icon(Icons.search,color: Colors.black,)),
        ],
      ),
      body: SfPdfViewer.asset('assets/files/flutter.pdf',
      controller: pdfViewerController,
      ),

      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(onPressed: (){
            pdfViewerController.zoomLevel=zoom+1/2;
            zoom++;
          }, icon: Icon(Icons.zoom_in)),
          SizedBox(
            width: 28.0,
          ),
          IconButton(onPressed: (){
            pdfViewerController.zoomLevel=0.0;
          }, icon: Icon(Icons.zoom_out_outlined)),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
