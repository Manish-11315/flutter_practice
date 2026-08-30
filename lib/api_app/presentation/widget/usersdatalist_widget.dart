import 'package:flutter/material.dart';
class UsersdatalistWidget extends StatelessWidget {
  final int userId;
  final int id;
  final String title;
  final bool iscompleted;
  const UsersdatalistWidget({super.key , required this.userId, required this.id, required this.title, required this.iscompleted});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:  BoxDecoration(
        borderRadius: BorderRadius.circular(22),
      ),
      child: Column(
        children: [
          Text("UserID : $userId"),
          Text("id : $id"),
          Text("title : $title"),
          Text("Completion Status : $iscompleted")
        ],
      ),
    );
  }
}
