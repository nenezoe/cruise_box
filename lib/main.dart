import 'package:cruise_box/screens/event_screen.dart';
import 'package:cruise_box/screens/screen1.dart';
import 'package:cruise_box/screens/initial_screen.dart';
import 'package:cruise_box/screens/screen2.dart';
import 'package:cruise_box/screens/screen3.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize a new Firebase App instance;
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: "/",
      routes: {
        "/": (context) => InitialScreen(),
        "/first": (context) => FirstScreen(),
        "/second": (context) => SecondScreen(),
        "/third": (context) => ThirdScreen(),
        "/fourth": (context) => EventScreen(),
      },
    );
  }
}
