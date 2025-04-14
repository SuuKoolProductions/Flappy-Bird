// ignore_for_file: avoid_print

import 'package:hive_flutter/hive_flutter.dart';
import 'dart:async';

class Database {
  final Box _myBox = Hive.box('user');

  void write(String id, dynamic value) {
    switch (id) {
      case "score":
        _myBox.put("score", value);
        break;
      case "background":
        _myBox.put("background", value);
        break;
      case "bird":
        _myBox.put("bird", value);
        print("bird is Activated");
        break;
      case "level":
        _myBox.put("level", value);
        break;
      case "audio":
        _myBox.put("audio", value);
        break;
      case "high score":
        _myBox.put("high score", value as int);
        _myBox.put("last reset date", DateTime.now().toIso8601String().split('T').first);
    }
  }

  dynamic read(String id) {
    dynamic value;
    switch(id){
      case "score":
        value = _myBox.get("score");
        break;
      case "background":
        value = _myBox.get("background");
        break;
      case "bird":
        value = _myBox.get("bird");
        break;
      case "level":
        value = _myBox.get("level");
        break;
      case "audio":
        value = _myBox.get("audio");
        break;
      case "high score":
        value = _myBox.get("high score");
        break;
    }
    return value;
  }

  Future<int> getHighScore() async {
    final dynamic lastResetDate = _myBox.get("last reset date");
    final String today = DateTime.now().toIso8601String().split('T').first;
    final int currentHighScore = read("high score") ?? 0;

    if (lastResetDate != null && lastResetDate != today) {
      print("Reset high score");
      print(lastResetDate);
      print(today);
      await setHighScore(0);
      return 0;
    } else {
      return currentHighScore;
    }
  }

  Future<void> setHighScore(int newHighScore) async {
    final int currentHighScore = await getHighScore();
    if (newHighScore > currentHighScore) {
      write("high score", newHighScore);
    }
  }
}