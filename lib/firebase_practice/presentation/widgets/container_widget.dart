import 'package:flutter/material.dart';
class ContainerWidget extends StatelessWidget {
  const ContainerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.amberAccent,
            blurRadius: 20,
            blurStyle: BlurStyle.inner,
            offset: Offset(0, 1)
          ),
          BoxShadow(
            color: Colors.amberAccent,
            blurRadius: 20,
            blurStyle: BlurStyle.inner,
            offset: Offset(0, 1)
          ),
          BoxShadow(
            color: Colors.amberAccent,
            blurRadius: 20,
            blurStyle: BlurStyle.inner,
            offset: Offset(0, 1)
          ),
        ]
      ),
    );
  }
}
