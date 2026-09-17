import 'package:flutter/material.dart';
import 'package:flutter_project_practice/interceptors_practice/app/data_entity.dart';
import 'package:flutter_project_practice/interceptors_practice/app/datasource.dart';
import 'package:flutter_project_practice/list_app/data/datamodel.dart';

class ScreenUi extends StatefulWidget {
  final interceptorAppDatasource interceptorappdatasourceobj;
  ScreenUi({super.key, required this.interceptorappdatasourceobj});

  @override
  State<ScreenUi> createState() => _ScreenUiState();
}

class _ScreenUiState extends State<ScreenUi> {

  final interceptorAppDatasource localinterceptorobj = interceptorAppDatasource();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child: Column(
            children: [
              Text("This is new screen"),
              MaterialButton(
                onPressed: (){
                  print("Function Started");
                  buttonpressed(context);
                  print("Function Existed");
                },
                child: Container(
                  decoration: BoxDecoration(color: Colors.amberAccent),
                  child: Text("Send Data To API"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<List<DataModel>> buttonpressed(BuildContext context) async{
    final data = await localinterceptorobj.getdata();
    print("Function Ran and this came : ${data.length}");
    return data;
  }
}
