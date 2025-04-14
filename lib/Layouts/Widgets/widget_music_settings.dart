// ignore_for_file: prefer_const_constructors

import 'package:flappy_bird/Database/database.dart';
import 'package:flutter/material.dart';
import 'package:flappy_bird/Global/strings.dart';

import '../../Global/constant.dart';
import '../../Global/functions.dart';

class MusicSettings extends StatefulWidget {
  const MusicSettings({Key? key}) : super(key: key);

  @override
  State<MusicSettings> createState() => _MusicSettingsState();
}

class _MusicSettingsState extends State<MusicSettings> {
  final Database db = Database();
  bool isMusicOn = true;

  @override
  void initState() {
    super.initState();
    isMusicOn = Str.isMusicOn;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.symmetric(vertical: 10),
            child: myText("Music", Colors.black, 20),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                onTap: () async {
                  db.write("audio", true);
                  await player.resume();
                },
                child: Icon(Icons.music_note_rounded, size: 40),
              ),
              GestureDetector(
                onTap: () async {
                  db.write("audio", false);
                  await player.pause();
                },
                child: Icon(Icons.music_off_rounded, size: 40),
              ),
            ],
          ),
          Switch(
            value: isMusicOn,
            onChanged: (bool value) {
              setState(() {
                isMusicOn = value;
                Str.isMusicOn = value;
                db.write("music", value);
              });
            },
          ),
        ],
      ),
    );
  }
}
