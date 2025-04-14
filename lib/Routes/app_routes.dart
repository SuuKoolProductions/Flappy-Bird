// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import '../Layouts/Pages/page_rate_us.dart';
import '../Layouts/Pages/page_start_screen.dart';
import '../Resources/strings.dart';
import '../Layouts/Pages/page_game.dart';
import '../Layouts/Pages/page_settings.dart';

class AppRoute{
  Route? generateRoute(RouteSettings settings){
    switch(settings.name){
      case Str.home:
        return MaterialPageRoute(builder: (_) => StartScreen());
      case Str.gamePage:
        return MaterialPageRoute(builder: (_) => GamePage(key: UniqueKey(), updateHighScore: (int score) {}));
      case Str.rateUs:
        return MaterialPageRoute(builder: (_) => RateUs());
      case Str.settings:
        return MaterialPageRoute(builder: (_) => Settings());
      default:
        return null;
    }
  }

  static Route<dynamic> _errorRoute (){
    return MaterialPageRoute(builder: (context) {
      return Scaffold(
        appBar: AppBar(
          title: Text("Error Page"),
          backgroundColor: Colors.redAccent,
        ),
        body: Center(
          child: Text("Error"),
        ),
      );
    },);
  }
}