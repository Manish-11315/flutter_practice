import 'package:dio/dio.dart';

class AuthInterceptors extends Interceptor{
  final Dio dioobj;
  AuthInterceptors({required this.dioobj});

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    final token = "Bearer token";
    handler.next(options);
  }
}

class LogInterceptors extends Interceptor{
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    print("Request made");
    handler.next(options);
  }
  @override
  void onResponse(Response<dynamic> response, ResponseInterceptorHandler handler) {
    print("Response made ");
    handler.next(response);
  }
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    print("Error occured ");
    handler.next(err);
  }

}
Dio dio = Dio()..interceptors.addAll([
  AuthInterceptors(dioobj: dio),
  LogInterceptor()
]);