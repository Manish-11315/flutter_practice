import 'package:dio/dio.dart';

class Dioexception extends DioException{
  Dioexception({required super.requestOptions});
}