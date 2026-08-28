import 'package:flutter_project_practice/api_app/domain/entities/userEntity.dart';

class Usermodel extends Userentity {
  final int userid;
  final int id;
  final String title;
  final bool iscompleted;

  Usermodel({
    required this.userid,
    required this.id,
    required this.title,
    required this.iscompleted,
  }) : super(userId: userid, id: id, title: title, completed: iscompleted);


  factory Usermodel.fromJson(Map<String, dynamic> json){
    return Usermodel(
        userid: json["userId"],
        id: json["id"],
        title: json["title"],
        iscompleted: json["completed"]
    );
  }
}
