import 'package:dio/dio.dart';

class Diosource{
  static final Diosource diosourceex = Diosource._internal();
  final Dio dio;

  factory Diosource() => diosourceex;

  Diosource._internal() : dio = Dio(
    BaseOptions(
      baseUrl: "https://jsonplaceholder.typicode.com/"
    )
  );
}