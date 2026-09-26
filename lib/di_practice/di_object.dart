import 'package:flutter/cupertino.dart';
import 'package:flutter_project_practice/api_app/core/di/di_init.config.dart';
import 'package:flutter_project_practice/di_practice/test_class.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

var getInstance = GetIt.instance;

void setup(){
  getInstance.registerFactory<TestClass>(() {
    debugPrint(" --------------------------------- Setup is called here in this step -------------------------------");
    return TestClass(name: "Name is not Important", id: 11315);
  });
  debugPrint("++++++++++++++++++++++++++++++ Setup is Created +++++++++++++++++++++ ");
}
@InjectableInit(
    initializerName: "DemoDi",
    preferRelativeImports: true,
    asExtension: true,
)
void demoDi(){
  demoinjectableclass() => getInstance.init();
}