import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_project_practice/api_app/data/datasources/diosource.dart';
import 'package:flutter_project_practice/api_app/data/datasources/userDataSource.dart';
import 'package:flutter_project_practice/api_app/data/repo_impl/userRepoImpl.dart';
import 'package:flutter_project_practice/api_app/domain/usecases/fetchallusers_usecase.dart';
import 'package:flutter_project_practice/api_app/domain/usecases/fetchsingleuser_usecase.dart';
import 'package:flutter_project_practice/api_app/domain/usecases/getUserUseCase.dart';
import 'package:flutter_project_practice/api_app/presentation/bloc/order_bloc/userBloc.dart';
import 'package:flutter_project_practice/api_app/presentation/bloc/order_bloc/userbloc_events.dart';
import 'package:flutter_project_practice/api_app/presentation/bloc/post_api_bloc/postBloc.dart';
import 'package:flutter_project_practice/api_app/presentation/screen/postApiScreenUi.dart';
import 'package:flutter_project_practice/connectivity_app/presentation/bloc/connectivity_bloc.dart';
import 'package:flutter_project_practice/connectivity_app/presentation/screen/connectivity_homescreen.dart';
import 'package:flutter_project_practice/list_app/bloc/listBloc.dart';
import 'package:flutter_project_practice/list_app/data/datamodel.dart';
import 'package:flutter_project_practice/list_app/ui/screen/listScreenUI.dart';

import 'api_app/presentation/screen/displayUserListScreen.dart';

void main() {
  final Dio getdioinstance = Diosource.create(url: "https://fake-store-api.mock.beeceptor.com/api/");
  final Dio postdioinstance = Diosource.create(url: "https://quickmock.dev/m/tBMReZjZXb2X/");
  final Userrepoimpl userrepoimplobj = Userrepoimpl(userdatasourceobj: Userdatasource(dioinstance: getdioinstance, postinstancedio: postdioinstance));
  List<Datamodel> datamodelobj = [];
  runApp(MyApp(userrepoimplobj: userrepoimplobj, datamodel: datamodelobj,));
}

class MyApp extends StatelessWidget {
  final Userrepoimpl userrepoimplobj;
  final List<Datamodel> datamodel;
  const MyApp({super.key, required this.userrepoimplobj, required this.datamodel});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: MultiBlocProvider(providers: [
        BlocProvider(create: (context) => ConnectivityBloc()),
        BlocProvider(create: (context) => Userbloc(
            fetchsingleuserUsecase: FetchsingleuserUsecase(repoobj: userrepoimplobj),
            fetchallusersUsecase: FetchallusersUsecase(userrepoobj: userrepoimplobj))..add(getallusersdata_event())
        ),
        BlocProvider(create: (context) => Postbloc(getuserusecaseinstance: Getuserusecase(userrepoobj: userrepoimplobj))),
        BlocProvider(create: (context) => Listbloc(datamodel: datamodel))
      ], child: ListScreenui()),
    );
  }
}
