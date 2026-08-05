import 'package:dio/dio.dart';

class Diosource {
  static final Diosource diosource = Diosource._internal();
  final Dio dio;

  Diosource._internal()
    : dio = Dio(
        BaseOptions(
          baseUrl: "https://jsonplaceholder.typicode.com/",
          connectTimeout: Duration(seconds: 10),
          receiveTimeout: Duration(seconds: 5),
          sendTimeout: Duration(seconds: 10)
        ),
      );
}
