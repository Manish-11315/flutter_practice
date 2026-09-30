import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_project_practice/firebase_practice/presentation/bloc/firebloc.dart';
import 'package:flutter_project_practice/firebase_practice/presentation/bloc/fireevents.dart';
import 'package:flutter_project_practice/firebase_practice/presentation/bloc/firestates.dart';
import 'package:flutter_project_practice/firebase_practice/presentation/screens/homescreen.dart';
import 'package:flutter_project_practice/firebase_practice/presentation/widgets/textfield.dart';

class registerScreen extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  registerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<Firebloc, fireStates>(
        builder: (context, states) {
          if (states is loadingFireState) {
            return Center(child: CircularProgressIndicator());
          } else if (states is sucessFireState) {
            final blocvalue = BlocProvider.of<Firebloc>(context);
            BlocProvider.value(value: blocvalue,child: homeScreen(),);
            Navigator.push(context, MaterialPageRoute(builder: (context)=> homeScreen()));
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
                  hintname: "Password",
                ),
              ),
              SizedBox(height: 20),
              GestureDetector(
                onTap: () {
                  onTapRegister(context);
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
          }
        },
      ),
    );
  }

  void onTapRegister(BuildContext context) {
    if (emailController.text.isNotEmpty && passwordController.text.isNotEmpty) {
      return BlocProvider.of<Firebloc>(context).add(
        registerUserEvent(
          email: emailController.text,
          password: passwordController.text,
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Please Fill all the details firstly")),
      );
    }
  }
}
