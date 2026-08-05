import 'package:network_state/api_test/domain/responseEntity.dart';

class Responsemodel extends Responseentity{
  String userId;
  int id;
  String title;
  bool completed;
  Responsemodel({
    required this.userId,
    required this.title,
    required this.id,
    required this.completed
  }) : super(
      userId: userId,
      id: id,
      title: title,
      completed: completed
  );

  factory Responsemodel.fromJson(Map<dynamic,dynamic> json){
    return Responsemodel(
        userId: json["userId"],
        title: json["title"],
        id: json["id"],
        completed: json["completed"]
    );
  }
}