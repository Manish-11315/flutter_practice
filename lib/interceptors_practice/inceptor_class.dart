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
        child: Text(dioceptor.printDio() as String),
      ),
    );
  }
}


class dioceptor{
  static final Dio dioobj = Dio();

  static Future<Response<dynamic>> printDio()async{
    final result = await dioobj.get("https://jsonplaceholder.typicode.com/todos");
    print(result.data);
    return result.data;
  }
}