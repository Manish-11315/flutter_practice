import 'package:flutter/material.dart';
class textFieldWidget extends StatelessWidget {
  final TextEditingController textEditingController;
  final String hintname;
  const textFieldWidget({super.key, required this.textEditingController, required this.hintname});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey,
        borderRadius: BorderRadius.circular(20)
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 8.0, bottom: 8, right: 8, left: 20),
        child: TextFormField(
          decoration: InputDecoration(
            label: Text(hintname, style:  TextStyle(color: Colors.black),),
            border: InputBorder.none,
            hintText: "Enter Your $hintname",
            hintStyle: TextStyle(color: Colors.black)
          ),
          controller: textEditingController,
          style: TextStyle(color: Colors.black),

        ),
      ),
    );
  }
}
