import 'package:bmiapp/splash.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'BMI App',
      theme: ThemeData(
        primarySwatch: Colors.teal,
        canvasColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.white),
        textTheme: const TextTheme(
          headline1: TextStyle(
              fontSize: 45, fontWeight: FontWeight.bold, color: Colors.teal),
          headline2: TextStyle(
              fontSize: 25, fontWeight: FontWeight.bold, color: Colors.white),
          headline3: TextStyle(
              fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
      home: splash(),
    );
  }
}
