import 'package:flutter_project_practice/api_app/domain/entities/post_api_entities/post_api_order.dart';

class Postapimodel extends PostApiOrderEntity {
  final String id;
  final String name;
  final String email;
  final String created_at;

  Postapimodel({
    required this.id,
    required this.name,
    required this.email,
    required this.created_at,
  }) : super(id: id, name: name, email: email, creation_time: created_at);

  factory Postapimodel.fromJson(Map<String, dynamic> json){
    return Postapimodel(id: json["id"],
        name: json["name"],
        email: json["email"],
        created_at: json["created_at"]);
  }

  Map<String, dynamic> toJson() => {
    "id" : id,
    "name" : name,
    "email" : email,
    "created_at" : created_at
  };
}
