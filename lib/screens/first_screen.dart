import 'package:flutter/material.dart';
import 'package:network_state/screens/widgets/card_widget.dart';
import 'package:network_state/screens/widgets/chip_widget.dart';

class FirstScreen extends StatelessWidget {
  FirstScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Hello James", style: TextStyle(color: Colors.black)),
            Text("Let's book your favourite film"),
          ],
        ),
      ),
      body: Container(

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Text("Categories"),
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ChipWidget(chip_text: "Drama", chipicon: Icons.masks),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ChipWidget(
                    chip_text: "Romance",
                    chipicon: Icons.monitor_heart,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ChipWidget(
                    chip_text: "Western",
                    chipicon: Icons.snapchat,
                  ),
                ),
              ],
            ),
            SizedBox(height: 40),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Now in cinemas"),
                  Text("See All", style: TextStyle(color: Colors.greenAccent)),
                ],
              ),
            ),

            Expanded(
              child: ListView.builder(
                itemCount: 5,
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CardWidget(cardheight: 10, cardwidth: 160),
                  );
                },
              ).build(context),
            ),
            SizedBox(height: 40),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Popular Movies"),
                  Text("See All", style: TextStyle(color: Colors.greenAccent)),
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: 5,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CardWidget(cardheight: 100, cardwidth: 160),
                  );
                },
              ).build(context),
            ),
          ],
        ),
      ),
    );
  }
}
