import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_project_practice/firebase_practice/presentation/bloc/firebloc.dart';
import 'package:flutter_project_practice/firebase_practice/presentation/bloc/fireevents.dart';
import 'package:flutter_project_practice/firebase_practice/presentation/bloc/firestates.dart';
class logoutScreen extends StatelessWidget {
  const logoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<Firebloc, fireStates>(
        builder: (context, state){
          if(state is logoutSuccessState){
            return Center(child: Text("User Logged Out Successfully"),);
          }else if(state is logoutErrorState){
            return Center(child: Text("An Error Occurred while Logging Out : ${state.errormessage}"),);
          }else if(state is logoutLoadingState){
            return Center(child: CircularProgressIndicator());
          }
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text("Logout Screen"),
                SizedBox(height: 40,),
                GestureDetector(
                  onTap: (){
                    onLogoutTap(context);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.redAccent,
                        borderRadius: BorderRadius.circular(20)
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("Logout", style:  TextStyle(color: Colors.white),),
                    ),
                  ),
                )
              ],
            ),
          );
        },
        listener: (context, state){

        },
      ),
    );
  }

  void onLogoutTap(BuildContext context){
    BlocProvider.of<Firebloc>(context).add(logoutUserEvent());
  }
}
