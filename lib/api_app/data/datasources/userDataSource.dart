import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_project_practice/api_app/data/datasources/diosource.dart';
import 'package:flutter_project_practice/api_app/domain/entities/userEntity.dart';

class Userdatasource {

  final Dio dioinstance;
  Userdatasource({required this.dioinstance});

  Factory<List<Userentity>> getAllUsersData(){
    try{
      final data = dioinstance.get("todos/");
      final datalist = data as List;
      return
    }on DioException catch (dioerr){
      if(dioerr.type == DioExceptionType.connectionTimeout){
        throw Exception("Cannot Connect to the Server");
      }else if(dioerr.type == DioExceptionType.sendTimeout){
        throw Exception("Cannot Send data to the Server");
      }else{
        throw Exception("Unhandled Dio Exception");
      }
    }catch (err){
      throw Exception("Unhandled Exception");
    }
  }


}