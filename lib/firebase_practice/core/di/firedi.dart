import 'package:flutter_project_practice/firebase_practice/core/di/firedi.config.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

var firediinstance = GetIt.instance;

@InjectableInit(
  initializerName: "firebaseDiInit",
  preferRelativeImports: true,
  asExtension: true
)
void setupfirebaseAppDependency() => firediinstance.firebaseDiInit();
