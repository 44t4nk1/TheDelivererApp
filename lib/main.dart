import 'package:flutter/material.dart';
import './screens/loginPage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        highlightColor: Colors.transparent,
        splashColor: Colors.transparent,
        brightness: Brightness.light,
        canvasColor: Color(0xffffffff),
        accentColor: Color(0xff0047ed),
        backgroundColor: Color(0xff212121),
        textTheme: TextTheme(
          bodyText1: TextStyle(
            color: Color(0xff212121),
          ),
        ),
      ),
      home: LoginPage(),
    );
  }
}
