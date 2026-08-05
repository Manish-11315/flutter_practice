
import 'package:flutter/material.dart';
class CardWidget extends StatelessWidget {
  double cardheight;
  double cardwidth;
  CardWidget({super.key, required this.cardheight, required this.cardwidth});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.blueAccent,
        borderRadius: BorderRadius.circular(25)
      ),
      height: cardheight,
      width: cardwidth,
    );
  }
}
