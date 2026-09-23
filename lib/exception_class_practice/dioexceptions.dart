import 'package:dio/dio.dart';
import 'package:flutter_project_practice/exception_class_practice/exception_class.dart';

AuthException convertToAuthException(DioException error){
  switch(error.type){
    case DioExceptionType.connectionTimeout:
    case DioExceptionType.sendTimeout:
    case DioExceptionType.receiveTimeout:
      return AuthException("Connection Timed Out");

    case DioExceptionType.connectionError:
      return AuthException("Check Your Internet Connection");

    default:
      return AuthException("Unhandled Exception error : ${error.response?.statusMessage}", statusCode : error.response?.statusCode);
  }
}

class DioSource{
  void setupDio()async{
    try{
      final Dio dio = Dio();
      dio.get("url");
    }on DioException catch (dioerror){
      throw convertToAuthException(dioerror);
    }
  }
}