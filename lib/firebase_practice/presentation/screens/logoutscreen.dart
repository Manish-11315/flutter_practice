import 'package:flutter/material.dart';
class logoutScreen extends StatelessWidget {
  const logoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child: Column(
            children: [
              Text("Logout Screen"),
              GestureDetector(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.redAccent
                  ),
                  child: Text("Logout", style:  TextStyle(color: Colors.white),),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
