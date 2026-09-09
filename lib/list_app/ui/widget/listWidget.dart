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
      child: Padding(
        padding: const EdgeInsets.only(left: 28.0, top: 10, bottom: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          spacing: 20,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Id   ===:===  ${datamodel.id} "),
                Text("Email   ===:===  ${datamodel.email} "),
                Text("Name   ===:===  ${datamodel.name} "),
                Text("Salary   ===:===  ${datamodel.salary} "),
              ],
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(right: 22.0),
                child: Align(
                  alignment: Alignment.centerRight,
                    child: Icon(Icons.delete)),
              ),
            )
          ],
        ),
      ),
    );
  }
}
