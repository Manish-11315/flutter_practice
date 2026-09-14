import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class DioInterceptorTest extends StatefulWidget {
  const DioInterceptorTest({super.key});

  @override
  State<DioInterceptorTest> createState() => _DioInterceptorTestState();
}

class _DioInterceptorTestState extends State<DioInterceptorTest> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            child: Text("this is data : ${callmethod()}")
        )
    );
  }

  Future<String> callmethod() async {
    return await dioceptor.printDio();
 }
}

class dioceptor {
  static final Dio dioobj = Dio();

  static Future<String> printDio() async {
    try {
      final result = await dioobj.get(
        "https://jsonplaceholder.typicode.com/todos",
      );
      dioobj.interceptors.add(InterceptorsWrapper(
        onRequest: (option,handler){
          LogInterceptor(requestUrl: true, responseBody: true);
          handler.next(option);
        }
      ));
      // print(
      //   " \n this is the response of the API : \n ========================================================= \n${result.data}",
      // );
      final datalist = result.data as Map;
      return datalist["title"];
    } catch (err) {
      return err.toString();
    }
  }
}
