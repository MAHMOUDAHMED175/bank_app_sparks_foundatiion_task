
import 'dart:io' as io;
import 'dart:async';
import 'package:fiels/model/image.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';

import 'package:sqflite/sqflite.dart';

class DBHelper{
  //
  static late Database _db;
  static const String ID='id';
  static const String NAME='photoName';
  static const String TABLE='PhotosTable';
  static const String DB_NAME='photos.db';

  Future<Database> get db async{
    // if(null!=_db) {
    //   return _db;
    // }
    _db = await initDB();
    return _db;
  }
  initDB() async{
    // هنا هيعمل ملف فى التلفون بتاعك وبعدين ياخد المسار ويسميه باسم الداتا بيز
    io.Directory doccumentsDirectory =await getApplicationDocumentsDirectory();
    String path = join(doccumentsDirectory.path,DB_NAME);
    var db=await openDatabase(path,version: 1,onCreate: _onCreate);
    return db;
  }


  _onCreate(Database db,int version)async{
    await db.execute('CREATE TABLE $TABLE ($ID INTEGER,$NAME TEXT)');
  }


  // هنا باخد الصوره اللى موجوده فى الجدول  علشان يعملها id  خاص بيها  واخزنها فى ال المودل فى ال id
  Future<Photo> save(Photo photo)async {
    var dbClient = await db;
    photo.id = await dbClient.insert(TABLE, photo.toMap());
    return photo;
  }


  // دى بتاخد اسم الصوره وال  id  وتخزنهم فى map
  //وبعدين نعمل ليست للصور ونضيف فيها اللى موجود فى ال map  وبعدين نرجع ليستت الصور دى
  Future<List<Photo>> getPhotos()async{
    var dbClient =await db;
    List<Map<String,dynamic>> maps =await dbClient.query(TABLE,columns: [ ID , NAME ]);
    List<Photo> photos =[];
    if(maps.length>0){
      for(int i=0;i<maps.length;i++){
        photos.add(Photo.fromMap(maps[i]));
      }
    }
    return photos;
  }


  Future close()async{
    var dbClient =await db;
    dbClient.close();
  }




}