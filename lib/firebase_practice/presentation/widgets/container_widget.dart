import 'package:flutter/material.dart';

class ContainerWidget extends StatelessWidget {
  final String heading;
  final VoidCallback ontap;

  ContainerWidget({super.key, required this.heading, required this.ontap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: ontap,
        child: Container(
          height: 80,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.amberAccent,
                blurRadius: 4,
                spreadRadius: 1,
                blurStyle: BlurStyle.outer,
                // offset: Offset(1, 1)
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(heading, style: TextStyle(fontSize: 20)),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Icon(Icons.arrow_forward),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
