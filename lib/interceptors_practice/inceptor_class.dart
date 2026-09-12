import 'package:dio/dio.dart';

class InceptorClass extends Interceptor{

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    // TODO: implement onError
    super.onError(err, handler);
  }
}