import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_project_practice/firebase_practice/presentation/bloc/fireevents.dart';

import '../bloc/firebloc.dart';
import '../bloc/firestates.dart';
import '../widgets/textfield.dart';
import 'dashboardscreen.dart';
class changePasswordScreen extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController reEnterPasswordController = TextEditingController();
  changePasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<Firebloc, fireStates>(
        builder: (context, states) {
          if (states is loadingFireState) {
            return Center(child: CircularProgressIndicator());
          }

          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: textFieldWidget(
                  textEditingController: emailController,
                  hintname: "Email",
                ),
              ),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: textFieldWidget(
                  textEditingController: passwordController,
                  hintname: "Enter A Password",
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: textFieldWidget(
                  textEditingController: reEnterPasswordController,
                  hintname: "Re-Enter your Password",
                ),
              ),
              SizedBox(height: 20),
              GestureDetector(
                onTap: () {
                  onTapButtonAction(context: context, email: emailController.text, password:  passwordController.text, passwordConfirmation: reEnterPasswordController.text);
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.redAccent,
                    borderRadius: BorderRadius.circular(18),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("Register"),
                    ),
                  ),
                ),
              ),
            ],
          );
        },
        listener: (context, states) {
          if (states is errorFireState) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(states.errormsg)));
          }else if (states is sucessFireState) {
            final blocvalue = BlocProvider.of<Firebloc>(context);
            BlocProvider.value(value: blocvalue,child: dashBoard(),);
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> dashBoard()));
          }
        },
      ),
    );
  }

  void onTapButtonAction({required BuildContext context, required String email, required String password, required String passwordConfirmation}){
    return BlocProvider.of<Firebloc>(context).add(updateUserPasswordEvent(email: email, currentPassword: password, newPassword: passwordConfirmation));
  }
}
