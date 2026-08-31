import 'package:flutter/material.dart';
class Searchuserscreen extends StatelessWidget {
  const Searchuserscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            TextFormField(
              decoration: InputDecoration(
                border: InputBorder.none
              ),
            )
          ],
        ),
      ),
    );
  }
}
