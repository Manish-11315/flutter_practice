import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_project_practice/api_app/data/datasources/diosource.dart';
import 'package:flutter_project_practice/api_app/data/models/usermodel.dart';
import 'package:flutter_project_practice/api_app/domain/entities/userEntity.dart';

class Userdatasource {

  final Dio dioinstance;
  Userdatasource({required this.dioinstance});

  Future<List<Usermodel>> getAllUsersData() async{
    try{
      final res = await dioinstance.get("todos/");
      final datalist = res.data as List;
      return datalist.map((r) => Usermodel.fromJson(r)).toList();
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

  Future<Usermodel> getSingleUserdata({required int id})async{
    try{
      final res = await dioinstance.get("todos/$id");
      final data = res.data;
      return Usermodel.fromJson(data);
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