

class Photo{
  int? id;
  String? photoName;
  Photo( {
    this.id,
    this.photoName,
    });

  Photo.fromMap(Map<String,dynamic> map){
    id=map['id'];
    photoName=map['photoName'];
    }

  /* علشان احول الداتا اللى جايالى الى Map*/
  Map<String,dynamic> toMap(){
    var map=<String,dynamic>{
      'id':id,
      'photoName':photoName,
    };
    return map;

  }
}