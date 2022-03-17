import 'package:collageproject/widget/chart.dart';
import 'package:collageproject/widget/splash.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme:
          ThemeData(colorScheme: ColorScheme.light(), fontFamily: "Quicksand"),
      debugShowCheckedModeBanner: false,
      home: Splash(),
    );
  }
}
