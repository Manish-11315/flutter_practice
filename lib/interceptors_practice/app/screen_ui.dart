import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_project_practice/interceptors_practice/app/data_entity.dart';
import 'package:flutter_project_practice/interceptors_practice/app/datasource.dart';

class ScreenUi extends StatefulWidget {
  final interceptorAppDatasource interceptorappdatasourceobj;

  ScreenUi({super.key, required this.interceptorappdatasourceobj});

  @override
  State<ScreenUi> createState() => _ScreenUiState();
}

class _ScreenUiState extends State<ScreenUi> {
  // late DataModel data;
  Map<String, dynamic> datamap = {};
  bool isloading = false;
  bool iserror = false;
  String name = "" ;
  String email = "" ;

  bool isdataloaded = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Interceptor Practice App"),
      ),
      body: Center(
        child: Container(
          child: Column(
            children: [
              Text("This is new screen"),
              MaterialButton(
                onPressed: () async{
                  setState(() {
                    isloading = true;
                  });
                  print("Function Started");
                  await buttonpressed(context);
                  print("Function Existed");
                  // setState(() {
                  //   isloading = false;
                  // });
                },
                child: Container(
                  decoration: BoxDecoration(color: Colors.amberAccent),
                  child: Text("Send Data To API"),
                ),
              ),
              Container(
                child:  isloading
                    ? isdataloaded
                          ? Expanded(
                    child: /*ListView.builder(
                                itemCount: data.length,
                                itemBuilder: (context, index) {
                                  final dataindex = data[index];
                                  print("Data came : $dataindex");
                                  return ListTile(
                                    title: Text(dataindex.name),
                                    subtitle: Text(dataindex.email),
                                  );
                                },
                              ),*/
                    Container(
                      child: Column(
                        children: [
                          Text("Name : ${name}"),
                          Text("EMail : ${email}"),
                        ],
                      ),

                    )
                )
                          : Center(child: CircularProgressIndicator())
                    : Center(child: Text("No Data Found")),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> buttonpressed(BuildContext context) async {
    setState(() {
      isloading = true;
    });
    try {
      final result = await widget.interceptorappdatasourceobj.getdata();
      setState(() {
        // data = result;
        datamap.addAll(result);
        name = datamap["name"];
        email = datamap["email"];
        print("Data in loaded : name = > $name  email => $email");
        isloading = false;
        isdataloaded = true;
        print("----------------------- Data loaded in state : ${datamap}");
      });
    } catch (error) {
      setState(() {
        isdataloaded = false;
        iserror = true;
        print("--------------------------- Error Occurred in state : ${error.toString()}");
      });
    } finally {
      setState(() {
        isloading = false;
      });
    }
  }
}
