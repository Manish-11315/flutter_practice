import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@singleton
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