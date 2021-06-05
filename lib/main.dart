import 'package:bmi_calculator/input_page.dart';

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Exact BMI Calculator',
      theme: ThemeData.dark().copyWith(
          primaryColor: Color(0xFF1976D2),
          scaffoldBackgroundColor: Color(0xFF0A0E21),
          floatingActionButtonTheme: FloatingActionButtonThemeData(
              foregroundColor: Colors.yellow, backgroundColor: Colors.purple)),
      initialRoute: "/",
      routes: {
        "/": (context) => InputPage(),
      },
    );
  }
}
