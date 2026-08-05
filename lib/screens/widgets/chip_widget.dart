import 'package:flutter/material.dart';
class ChipWidget extends StatelessWidget {
  String chip_text;
  IconData chipicon;
  ChipWidget({super.key, required this.chip_text, required this.chipicon});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey,
        borderRadius: BorderRadius.circular(34)
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Icon(chipicon)
            ,Text(
              chip_text
            ),
          ],
        ),
      ),
    );
  }
}
