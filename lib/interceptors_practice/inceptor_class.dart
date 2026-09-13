import 'package:dio/dio.dart';

class Interceptorclass extends Interceptor{
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {}

  bool is_connectionretry(DioException err){
    return err.type == DioExceptionType.connectionError;
  }
}