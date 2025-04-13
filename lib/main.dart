import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:flappy_bird/Database/database.dart';
import 'Layouts/Pages/page_login.dart';
import 'Routes/app_routes.dart';
import 'Utils/strings.dart';
import 'package:firebase_auth/firebase_auth.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.web,
  );
  await Hive.initFlutter();
  await Hive.openBox("myBox");
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  final myBox = Hive.box("myBox");
  late Database db;
  bool isUserLoggedIn = false;
  bool firstTime = false;

  @override
  void initState() {
    db = Database();
    super.initState();
    _checkLoginStatus();
  }

  void _checkLoginStatus() {
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user == null) {
        setState(() {
          isUserLoggedIn = false;
        });
      } else {
        setState(() {
          isUserLoggedIn = true;
        });
      }
    });
  }

  void updateHighScore(int score) {
    setState(() {
       db.setHighScore(score);
    });
  }

  @override
  Widget build(BuildContext context) {
    if (myBox.get("highScore") == null) {
      firstTime = true;
    }
    return MaterialApp(
      initialRoute: isUserLoggedIn ? Str.game : Str.login,
      onGenerateRoute: AppRoute().generateRoute,
    );
  }
}