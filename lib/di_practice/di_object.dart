import 'package:flutter/cupertino.dart';
import 'package:flutter_project_practice/di_practice/test_class.dart';
import 'package:get_it/get_it.dart';

var getInstance = GetIt.instance;

void setup(){
  getInstance.registerLazySingleton<TestClass>(()=> TestClass());
  debugPrint("Setup is called");
}