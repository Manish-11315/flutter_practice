import 'package:flutter_project_practice/firebase_practice/domain/entities/userentity.dart';

class firebaseUserdatamodel extends Userentity {
  final String email;
  final String username;
  final String password;
  final bool is_banned;

  firebaseUserdatamodel({
    required this.email,
    required this.username,
    required this.password,
    required this.is_banned,
  }) : super(
         email: email,
         password: password,
         username: username,
         is_banned: is_banned,
       );

  factory firebaseUserdatamodel.fromJson(Map<String, dynamic> json) {
    return firebaseUserdatamodel(
      email: json["email"],
      username: json["username"],
      password: json["password"],
      is_banned: json["is_banned"],
    );
  }

  Map<String, dynamic> toJson(String email, String password,{String? newpassword}) => {
    "email" : email,
    "password" : password,
    "newpassword" : newpassword
  };
}
