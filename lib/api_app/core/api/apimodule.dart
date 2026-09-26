import 'package:dio/dio.dart';
import 'package:flutter_project_practice/api_app/data/datasources/diosource.dart';
import 'package:injectable/injectable.dart';

@module
abstract class Apimodule {
  @Named("getdioinstance")
  @lazySingleton
  Dio get getdio => Diosource.create(url: "https://fake-store-api.mock.beeceptor.com/api/");

  @Named("postdioinstance")
  @lazySingleton
  Dio get postdio => Diosource.create(url: "https://quickmock.dev/m/tBMReZjZXb2X/");
}