import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_project_practice/firebase_practice/presentation/bloc/firebloc.dart';
import 'package:flutter_project_practice/firebase_practice/presentation/bloc/firestates.dart';

class dashBoard extends StatelessWidget {
  dashBoard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          BlocBuilder<Firebloc, fireStates>(
            builder: (context, state) {
              if (state is sucessFireState) {
                return Center(
                  child: Text(
                    "Welcome : ${state.userCredential!.user!.email}",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.redAccent,
                      fontSize: 30,
                    ),
                  ),
                );
              }else if(state is loadingFireState){
                return Center(child: CircularProgressIndicator(color: Colors.redAccent,),);
              }else if(state is errorFireState){
                return Center(child: Text(state.errormsg, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),),);
              }
              return Center(child: Text("This is Dashboard Screen"));
            },
          ),
        ],
      ),
    );
  }
}
