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
  List<DataModel> data = [];
  bool isloading = false;
  bool iserror = false;
  bool isdataloaded = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  setState(() {
                    isloading = false;
                  });
                },
                child: Container(
                  decoration: BoxDecoration(color: Colors.amberAccent),
                  child: Text("Send Data To API"),
                ),
              ),
              Container(
                child: isdataloaded
                    ? isloading
                          ? Center(child: CircularProgressIndicator())
                          : ListView.builder(
                              itemCount: data.length,
                              itemBuilder: (context, index) {
                                final dataindex = data[index];
                                return ListTile(
                                  title: Text(dataindex.name),
                                  subtitle: Text(dataindex.email),
                                );
                              },
                            )
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
        data = result;
        isloading = false;
        isdataloaded = true;
      });
    } catch (error) {
      setState(() {
        isdataloaded = false;
        iserror = true;
        print("Error Occurred : ${error.toString()}");
      });
    } finally {
      setState(() {
        isloading = false;
      });
    }
  }
}
