import 'package:flutter/material.dart';

import '../widgets/container_widget.dart';
class profileScreen extends StatelessWidget {
  profileScreen({super.key});
  List<String> listoftitles = ["Change Password", "Delete Account", "Logout", "Login", "Change Username", "Register User"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: listoftitles.length,
                itemBuilder: (context, index){
                  return ContainerWidget(heading: listoftitles[index],);
            }),
          )
        ],
      ),
    );
  }
}
