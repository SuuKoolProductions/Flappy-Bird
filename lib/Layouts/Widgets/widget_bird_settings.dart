// ignore_for_file: prefer_const_constructors

import 'package:flappy_bird/Database/database.dart';
import 'package:flappy_bird/Global/strings.dart';
import 'package:flutter/material.dart';

import '../../Global/functions.dart';

class BirdSettings extends StatefulWidget {
  const BirdSettings({Key? key}) : super(key: key);

  @override
  State<BirdSettings> createState() => _BirdSettingsState();
}

class _BirdSettingsState extends State<BirdSettings> {
  final Database db = Database();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            margin: EdgeInsets.symmetric(vertical: 10),
            child: myText("Characters", Colors.black, 20)),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            GestureDetector(
              onTap: () {
                setState(() {
                  Str.bird = "assets/pics/bird.png";
                  db.write("bird", Str.bird);
                });
              },
              child: SizedBox(
                width: 75,
                height: 75,
                child: Image.asset(
                  "assets/pics/bird.png",
                  fit: BoxFit.cover,
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  Str.bird = "assets/pics/blue.png";
                  db.write("bird", Str.bird);
                });
              },
              child: SizedBox(
                width: 75,
                height: 75,
                child: Image.asset(
                  "assets/pics/blue.png",
                  fit: BoxFit.cover,
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  Str.bird = "assets/pics/green.png";
                  db.write("bird", Str.bird);
                });
              },
              child: SizedBox(
                width: 75,
                height: 75,
                child: Image.asset(
                  "assets/pics/green.png",
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
