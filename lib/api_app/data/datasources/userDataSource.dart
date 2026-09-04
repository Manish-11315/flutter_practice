import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_project_practice/api_app/data/datasources/diosource.dart';
import 'package:flutter_project_practice/api_app/data/models/products_model/productsmodel.dart';
import 'package:flutter_project_practice/api_app/domain/entities/products_entities/productsEntity.dart';

class Userdatasource {

  final Dio dioinstance;
  Userdatasource({required this.dioinstance});

  Future<List<productsModel>> getAllUsersData() async{
    try{
      final res = await dioinstance.get("products/");
      print("Response data: ${res.data}");        // see actual data
      print("Status code: ${res.statusCode}");    // see status
      final datalist = res.data as List;
      return datalist.map((r) => productsModel.fromJson(r)).toList();
    }on DioException catch (dioerr){
      if(dioerr.type == DioExceptionType.connectionTimeout){
        throw Exception("Cannot Connect to the Server");
      }else if(dioerr.type == DioExceptionType.sendTimeout){
        throw Exception("Cannot Send data to the Server");
      }else{
        throw Exception("Unhandled Dio Exception");
      }
    }catch (err){
      print("====================== Error : $err");
      throw Exception("Unhandled Exception : $err");

    }
  }

  Future<productsModel> getSingleUserdata({required int id})async{
    try{
      final res = await dioinstance.get("todos/$id");
      final data = res.data;
      return productsModel.fromJson(data);
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