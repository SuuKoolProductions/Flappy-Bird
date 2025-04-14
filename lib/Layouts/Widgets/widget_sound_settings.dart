import 'package:flutter/material.dart';
import 'package:flappy_bird/Global/strings.dart';
import 'package:flappy_bird/Global/database.dart';

class SoundSettings extends StatefulWidget {
  const SoundSettings({Key? key}) : super(key: key);

  @override
  State<SoundSettings> createState() => _SoundSettingsState();
}

class _SoundSettingsState extends State<SoundSettings> {
  final db = Database();
  bool isSoundOn = true;

  @override
  void initState() {
    super.initState();
    isSoundOn = Str.isSoundOn;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          "Sound",
          style: TextStyle(fontSize: 20),
        ),
        Switch(
          value: isSoundOn,
          onChanged: (bool value) {
            setState(() {
              isSoundOn = value;
              Str.isSoundOn = value;
              db.write("sound", value);
            });
          },
        ),
      ],
    );
  }
} 