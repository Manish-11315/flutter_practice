import 'package:flutter/material.dart';
class CircularDot extends StatelessWidget {
  Color colors;
  CircularDot({super.key, required this.colors});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(120),
        color: Colors.greenAccent
      ),
    );
  }
}
