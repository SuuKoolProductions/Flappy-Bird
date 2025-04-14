// ignore_for_file: prefer_const_constructors
import 'package:flappy_bird/Database/database.dart';
import 'package:flappy_bird/Global/strings.dart';
import 'package:flutter/material.dart';
import '../../Global/functions.dart';

class ThemesSettings extends StatefulWidget {
  const ThemesSettings({Key? key}) : super(key: key);
  @override
  State<ThemesSettings> createState() => _ThemesSettingsState();
}

class _ThemesSettingsState extends State<ThemesSettings> {
  final Database db = Database();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: MediaQuery.of(context).size.height * 0.026),
      child: Column(
        children: [
          Container(
              margin: EdgeInsets.symmetric(vertical: 10),
              child: myText("Themes", Colors.black, 20)),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    Str.image = "background";
                    db.write("background", Str.image);
                  });
                },
                child: SizedBox(
                  width: 75,
                  height: 75,
                  child: Image.asset(
                    "assets/pics/background.png",
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    Str.image = "background2";
                    db.write("background", Str.image);
                  });
                },
                child: SizedBox(
                  width: 75,
                  height: 75,
                  child: Image.asset(
                    "assets/pics/background2.png",
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    Str.image = "background3";
                    db.write("background", Str.image);
                  });
                },
                child: SizedBox(
                  width: 75,
                  height: 75,
                  child: Image.asset(
                    "assets/pics/background3.png",
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}