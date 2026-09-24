import 'package:flutter/material.dart';
import 'package:flutter_project_practice/di_practice/di_object.dart';
import 'package:flutter_project_practice/di_practice/test_class.dart';

class DiUi extends StatefulWidget {
  const DiUi({super.key});

  @override
  State<DiUi> createState() => _DiUiState();
}

class _DiUiState extends State<DiUi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: MaterialButton(
          onPressed: () {
            final int? id = getInstance<TestClass>().id;
            final String? name = getInstance<TestClass>().name;
            debugPrint("ID : $id ,  \t name : $name ");
          },
          child: Text("Send Data"),
        ),
      ),
    );
  }
}
