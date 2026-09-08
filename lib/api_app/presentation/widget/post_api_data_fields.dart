import 'package:flutter/material.dart';
class textWidget extends StatelessWidget {
  final TextEditingController textEditingController;
  final String hinttext;
  const textWidget({super.key, required this.textEditingController, required this.hinttext});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextFormField(
        controller: textEditingController,
        decoration: InputDecoration(
          border: InputBorder.none,
          hint: Text(hinttext),
        ),
      ),
    );
  }
}
