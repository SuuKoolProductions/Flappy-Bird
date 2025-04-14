// ignore_for_file: prefer_const_constructors

import 'package:flappy_bird/Database/database.dart';
import 'package:flappy_bird/Global/functions.dart';
import 'package:flutter/material.dart';
import 'package:flappy_bird/Global/strings.dart';

import '../../Global/constant.dart';

class DifficultySettings extends StatefulWidget {
  const DifficultySettings({Key? key}) : super(key: key);

  @override
  State<DifficultySettings> createState() => _DifficultySettingsState();
}

class _DifficultySettingsState extends State<DifficultySettings> {
  final Database db = Database();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin:
          EdgeInsets.only(bottom: MediaQuery.of(context).size.height * 0.026),
      child: Column(
        children: [
          Container(
              margin: EdgeInsets.symmetric(vertical: 10),
              child: myText("Difficulty", Colors.black, 20)),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    Str.level = 280;
                    barrierMovement = 280;
                    db.write("level", barrierMovement);
                  });
                },
                child: const Text("Easy"),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    Str.level = 230;
                    barrierMovement = 230;
                    db.write("level", barrierMovement);
                  });
                },
                child: const Text("Medium"),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    Str.level = 200;
                    barrierMovement = 200;
                    db.write("level", barrierMovement);
                  });
                },
                child: const Text("Hard"),
              ),
            ],
          ),
        ],
      ),
    );
  }
}