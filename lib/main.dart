import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_project_practice/api_app/data/datasources/diosource.dart';
import 'package:flutter_project_practice/api_app/data/datasources/userDataSource.dart';
import 'package:flutter_project_practice/api_app/data/repo_impl/userRepoImpl.dart';
import 'package:flutter_project_practice/api_app/domain/usecases/fetchallusers_usecase.dart';
import 'package:flutter_project_practice/api_app/domain/usecases/fetchsingleuser_usecase.dart';
import 'package:flutter_project_practice/api_app/presentation/bloc/userBloc.dart';
import 'package:flutter_project_practice/connectivity_app/presentation/bloc/connectivity_bloc.dart';
import 'package:flutter_project_practice/connectivity_app/presentation/screen/connectivity_homescreen.dart';

import 'api_app/presentation/screen/displayUserListScreen.dart';

void main() {
  final Dio dioinstance = Diosource().dio;
  final Userrepoimpl userrepoimplobj = Userrepoimpl(userdatasourceobj: Userdatasource(dioinstance: dioinstance));
  runApp(MyApp(userrepoimplobj: userrepoimplobj,));
}

class MyApp extends StatelessWidget {
  final Userrepoimpl userrepoimplobj;
  const MyApp({super.key, required this.userrepoimplobj});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        colorScheme: .fromSeed(seedColor: Colors.deepPurple),
      ),
      home: MultiBlocProvider(providers: [
        BlocProvider(create: (context) => ConnectivityBloc()),
        BlocProvider(create: (context) => Userbloc(
            fetchsingleuserUsecase: FetchsingleuserUsecase(repoobj: userrepoimplobj),
            fetchallusersUsecase: FetchallusersUsecase(userrepoobj: userrepoimplobj))
        )
      ], child: Displayuserlistscreen()),
    );
  }
}
