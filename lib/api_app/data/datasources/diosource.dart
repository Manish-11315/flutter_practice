import 'package:dio/dio.dart';

class Diosource{
  static Dio create({required String url}){
    return Dio(
      BaseOptions(
        baseUrl: url,
        connectTimeout: Duration(seconds: 10)
      )
    );
  }
}