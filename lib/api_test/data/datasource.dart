import 'package:dio/dio.dart';
import 'package:network_state/api_test/data/diosource.dart';
import 'package:network_state/api_test/data/responseModel.dart';
import 'package:network_state/api_test/domain/responseEntity.dart';

class Datasource {
  final Dio _dio = Diosource.diosource.dio;

  Future<List<Responseentity>> getallusersdata() async {
    try{
      final response = await _dio.get("/todos/");
      final datalist = response.data as List;
      return datalist.map((e) => Responsemodel.fromJson(e)).toList();
    }on DioException catch (dioerr){
      if(dioerr.type == DioExceptionType.connectionTimeout){
        throw Exception("Error Connecting To server : ${dioerr.error.toString()}");
      }else if(dioerr.type == DioExceptionType.receiveTimeout){
        throw Exception("Internet Connection error : ${dioerr.error.toString()}");
      }else{
        throw Exception("Unhandled Exception ${dioerr.error.toString()}");
      }
    }catch(err){
      throw Exception("An Error Occurred : ${err.toString()}");
    }

  }

  Future<Responseentity> getUserDataById(int uid) async{
    try{
      final response = await _dio.get("/todos/$uid");
      final listdata = response.data;
      return listdata.map((e) => Responsemodel.fromJson(e));
    }on DioException catch (dioerr){
      if(dioerr.type == DioExceptionType.connectionTimeout){
        throw Exception("Error Connecting To server : ${dioerr.error.toString()}");
      }else if(dioerr.type == DioExceptionType.receiveTimeout){
        throw Exception("Internet Connection error : ${dioerr.error.toString()}");
      }else if(dioerr.type == DioExceptionType.receiveTimeout){
        throw Exception("Internet Connection error : ${dioerr.error.toString()}");
      }else{
        throw Exception("Unhandled Exception ${dioerr.error.toString()}");
      }
    }catch(err){
      throw Exception("An Error Occurred : ${err.toString()}");
    }
  }
}