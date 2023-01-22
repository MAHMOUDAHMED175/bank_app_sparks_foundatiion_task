
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:fiels/component/cubit/states.dart';
import 'package:fiels/screen/new_tasks.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sqflite/sqflite.dart';

import '../../model/image.dart';
import '../utility.dart';
import 'db_helper.dart';
class FilesCubit extends Cubit<FilesStates>{
  FilesCubit():super(FilesInitialState());
  static FilesCubit get(context)=> BlocProvider.of(context);


  int currentIndex=0;

  List<String> title=[
    'My Files',
  ];
  List<Widget> screen=[
    NewTasks(),

  ];

  void ChangeIndex(index){
    currentIndex=index;
    emit(FilesChangeCurvedNavBarState());

  }

  bool isShowenBottwonSheet=false;
  IconData fabIcon=Icons.edit;

  void ChangeBottomSheet(
      {
        required bool isShwon,
        required IconData icon,
      }){
    isShowenBottwonSheet=isShwon;
    fabIcon=icon;
    emit(FilesChangeBottomSheetState());
  }

  late Database database;
  List<Map> newTasks=[];

  void CreateDatabase() {
    openDatabase(
      'files.db',
      version: 1,
      onCreate: (database, version) {
        print("congratulation database is created");
        database.execute(
            'CREATE TABLE newTasks(id INTEGER PRIMARY KEY,title TEXT,date TEXT,time TEXT,status TEXT)'
        ).then((value) {
          print('table is created');
        }).catchError((error) {
          print('errror when create table');
        });
      },
      onOpen: (database) {
        getDatabase(database);
        print("congratulation database is opend");
      },
    ).then((value) {
      database = value;
      emit(FilesCreateDatabaseState());
    });
  }

  Future InsertDatabase({
    required String title,
    required String time,
    required String date,
  }) async {
    return await database.transaction((txn) {
      return txn.rawInsert(
          'INSERT INTO newTasks(title,time,date,status)VALUES("$title","$time","$date","new")'
      ).then((value) {
        emit(FilesInsertDatabaseState());
        print("values inserted successfully");
        getDatabase(database);

      }).catchError((error) {
        print("error when inserted database");
      });
    });
  }

  void   getDatabase(database){
     newTasks=[];

    emit(FilesGetDatabaseLoadingState());
    database.rawQuery('SELECT * FROM newTasks').then((value) {
      value.forEach((element){
        newTasks.add(element);
      });
      emit(FilesGetDatabaseState());
    });
  }

  void DeleteData(
      int id,
      )async{
    database.rawDelete('DELETE  FROM newTasks WHERE id=?', [id],).then((value) {
      getDatabase(database);
      emit(FilesDeleteDatabaseState());
    });
  }

  //
  //
  // File? filesImage;
  // var picker=ImagePicker();
  // Future<void> getFilesImage()async {
  //   final pickedFile = await picker.pickImage(
  //       source: ImageSource.gallery,
  //   );
  //
  //   if(pickedFile!=null)
  //   {
  //     filesImage=File(pickedFile.path);
  //     emit(FilesImageSuccess());
  //   }
  //   else {
  //     print('No image selected ');
  //     emit(FilesImageError());
  //   }
  //
  // }












































}
