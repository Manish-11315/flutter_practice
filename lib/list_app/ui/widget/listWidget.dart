import 'package:flutter/material.dart';
import 'package:flutter_project_practice/list_app/data/datamodel.dart';
class Listwidget extends StatelessWidget {
  final Datamodel datamodel;
  const Listwidget({super.key, required this.datamodel});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:  BoxDecoration(
        color: Colors.redAccent,
        borderRadius: BorderRadius.circular(30)
      ),
      child: Column(
        children: [
          Text("Id   ===:===  ${datamodel.id} "),
          Text("Email   ===:===  ${datamodel.email} "),
          Text("Name   ===:===  ${datamodel.name} "),
          Text("Salary   ===:===  ${datamodel.salary} "),
        ],
      ),
    );
  }
}
