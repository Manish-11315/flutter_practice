import 'dart:developer';

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
    final data = await dioceptor.printDio();
    print("Data in callmethod : $data");
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
          log(option.baseUrl);
          log("Method Name : =============================================== ===================== ${option.method.toUpperCase()}");
          handler.next(option);
        }
      ));
      // print(
      //   " \n this is the response of the API : \n ========================================================= \n${result.data}",
      // );
      final datalist = result.data as List;
      print("DataList : => =================================== ${datalist}");
      Map<String, dynamic> datamapped = {};
      final title = datalist.map((data) => datamapped["title"].toString()).toList();
      print("\n\n\n\n\t Title of the page \t\t\t ======================================  $title \n\n\n\n");
      return "title";
    } catch (err) {
      return err.toString();
    }
  }
}
