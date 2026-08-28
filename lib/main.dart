import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_project_practice/connectivity_app/presentation/bloc/connectivity_bloc.dart';
import 'package:flutter_project_practice/connectivity_app/presentation/screen/connectivity_homescreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
      ], child: ConnectivityHomescreen()),
    );
  }
}
