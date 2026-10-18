import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_project_practice/firebase_practice/presentation/bloc/firebloc.dart';
import 'package:flutter_project_practice/firebase_practice/presentation/bloc/fireevents.dart';
class deleteAccountScreen extends StatelessWidget {
  final String email;
  final String password;
  deleteAccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Delete User Account Screen"),
            SizedBox(height: 60,),
            Padding(padding: EdgeInsetsGeometry.all(20), child: GestureDetector(
              onTap: (){},
              child: Container(
                decoration:  BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.redAccent
                ),
                child: Text("Delete Account"),
              ),
            ),)
          ],
        ),
      ),
    );
  }

  void onTapDeleteAccount(){
    BlocProvider.of<Firebloc>(context).add(deleteUserEvent(email: email, password: password));
  }
}
