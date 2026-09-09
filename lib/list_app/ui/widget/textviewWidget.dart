import 'package:flutter/material.dart';
class Textviewwidget extends StatelessWidget {
  final TextEditingController textEditingController;
  final String hinttext;
  final TextInputType textInputType;
  const Textviewwidget({super.key, required this.textEditingController, required this.hinttext, required this.textInputType});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
      ),
      child: TextFormField(
        decoration: InputDecoration(
          border: InputBorder.none,
          hint: Text(hinttext),
        ),
        controller: textEditingController,
        keyboardType: textInputType,
      ),
    );
  }
}
