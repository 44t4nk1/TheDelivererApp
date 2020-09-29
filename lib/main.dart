import 'package:flutter/material.dart';
import './screens/loginPage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        brightness: Brightness.light,
        canvasColor: Color(0xff050505),
        accentColor: Color(0xff004FFF),
      ),
      home: LoginPage(),
    );
  }
}
