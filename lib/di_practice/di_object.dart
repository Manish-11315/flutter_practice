import 'package:flutter/cupertino.dart';
import 'package:flutter_project_practice/di_practice/test_class.dart';
import 'package:get_it/get_it.dart';

var getInstance = GetIt.instance;

void setup(){
  getInstance.registerFactory<TestClass>(() {
    debugPrint(" --------------------------------- Setup is called here in this step -------------------------------");
    return TestClass(name: "Name is not Important", id: 11315);
  });
  debugPrint("++++++++++++++++++++++++++++++ Setup is Created +++++++++++++++++++++ ");
}