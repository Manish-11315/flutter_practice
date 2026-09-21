import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';

class AuthInterceptors extends Interceptor{
  final String token;
  AuthInterceptors({required this.token});

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers["Authorization"] = "Bearer $token";
    print("Header Token is : $token");
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

class RetryInterceptor extends Interceptor{
  final Dio dioobj;
  StreamSubscription? streamSubscription;
  Connectivity connectivity = Connectivity();
  RetryInterceptor({required this.dioobj});

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    if(err.type == DioExceptionType.connectionTimeout || err.type == DioExceptionType.connectionError){
      streamSubscription = connectivity.onConnectivityChanged.listen((ondata){
        if(ondata.contains(ConnectivityResult.mobile) || ondata.contains(ConnectivityResult.wifi)){
          streamSubscription?.cancel();
          dioobj.fetch(err.requestOptions).then((onValue){
            handler.resolve(onValue);
          });
        }
      });
    }else{
      handler.next(err);
    }
  }
}


class Diosource{
  final newtoken = "Got token from the secure storage";

  void dryrun(){
    final Dio dio2 = Dio()..interceptors.addAll([AuthInterceptors(token: newtoken)]);
  }

  late final Dio dio = Dio()..interceptors.addAll([AuthInterceptors(token:  newtoken),LogInterceptors(), RetryInterceptor(dioobj: dio)]);

}