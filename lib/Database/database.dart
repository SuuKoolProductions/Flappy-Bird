// ignore_for_file: avoid_print

import 'package:hive_flutter/hive_flutter.dart';
import 'dart:async';

void write(String id, dynamic value) async {
  final Box myBox = Hive.box('user');
  switch (id) {
    case "score":
      myBox.put("score", value);
      break;
    case "background":
      myBox.put("background", value);
      break;
    case "bird":
      myBox.put("bird", value);
      print("bird is Activated");
      break;
    case "level":
      myBox.put("level", value);
      break;
    case "audio":
      myBox.put("audio", value);
      break;
    case "high score":
      myBox.put("high score", value as int);
      myBox.put("last reset date", DateTime.now().toIso8601String().split('T').first);
  }
}

dynamic read(String id) {
  final myBox = Hive.box('user');
  dynamic value;
  switch(id){
    case "score":
      value = myBox.get("score");
      break;
    case "background":
      value = myBox.get("background");
      break;
    case "bird":
      value = myBox.get("bird");
      break;
    case "level":
      value = myBox.get("level");
      break;
    case "audio":
      value = myBox.get("audio");
      break;
    case "high score":
      value = myBox.get("high score");
      break;
  }
  return value;
}

Future<int> getHighScore() async {
  final myBox = Hive.box('user');
  final dynamic lastResetDate = myBox.get("last reset date");
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
    write("high score", newHighScore);  }
}