import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/firebloc.dart';
import '../bloc/fireevents.dart';
import '../bloc/firestates.dart';
import '../widgets/textfield.dart';
import 'homescreen.dart';
class loginScreen extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  loginScreen({super.key});

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
                child: Align(alignment: AlignmentGeometry.centerLeft,child: Text("User Login", style:  TextStyle(color: Colors.redAccent, fontSize: 40, fontWeight: FontWeight.bold),)),
              ),
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
          }else if (states is sucessFireState) {
            final blocvalue = BlocProvider.of<Firebloc>(context);
            BlocProvider.value(value: blocvalue,child: homeScreen(),);
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> homeScreen()));

          }
        },
      ),
    );
  }

  void onTapRegister(BuildContext context) {
    if (emailController.text.isNotEmpty && passwordController.text.isNotEmpty) {
      return BlocProvider.of<Firebloc>(context).add(
        loginUserEvent(
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
