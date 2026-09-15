import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class DioInterceptorTest extends StatefulWidget {
  const DioInterceptorTest({super.key});

  @override
  State<DioInterceptorTest> createState() => _DioInterceptorTestState();
}

class _DioInterceptorTestState extends State<DioInterceptorTest> {

  late Future<List<String>> _titleheadings;

  @override
  void initState(){
    _titleheadings  = dioceptor.printDio();
    print("Instance of title in initstate : $_titleheadings");
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: FutureBuilder(
          future: _titleheadings,
          builder: (context, asyncSnapshot) {
            if (asyncSnapshot.connectionState == ConnectionState.done) {
              final listdata = asyncSnapshot.data;
              return ListView.builder(
                  itemCount: listdata?.length,
                  itemBuilder: (context, index){
                    return ListTile(title: Text(_titleheadings.toString()),);
                  }
              );
            }
            return Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }

  Future<String> callmethod() async {
    final data = await dioceptor.printDio();
    print("Data in callmethod : ${data}");
    return data[0];
  }
}

class dioceptor {
  static final Dio dioobj = Dio()
    ..interceptors.add(
      InterceptorsWrapper(
        onRequest: (option, handler) {
          log("Url link :====================================================================== ${option.uri}");
          log("Method Name : =============================================== ================== ${option.method.toUpperCase()}");
          handler.next(option);
        },

        onResponse: (response, handler) {
          log("Response Status Code : ${response.statusCode}, ${response.statusMessage}");
          handler.next(response);
        },
        onError: (error, handler) {
          log("Error Message : ${error.error}");
          handler.next(error);
        },
      ),
    );

  static Future<List<String>> printDio() async {
    final result = await dioobj.get(
        "https://jsonplaceholder.typicode.com/todos",
      );

      // print(
      //   " \n this is the response of the API : \n ========================================================= \n${result.data}",
      // );
      final datalist = result.data as List;
      print(
        "DataList : => =================================== ${datalist[0]["title"]}",
      );
      // Map<String, dynamic> datamapped = {};
      final title = datalist.map((data) => data["title"].toString()).toList();
      // print("\n\n\n\n\t Title of the page \t\t\t ======================================  $title \n\n\n\n");
      final name = title;
      return name;

  }
}
