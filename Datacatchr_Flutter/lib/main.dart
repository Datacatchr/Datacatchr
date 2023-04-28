import 'package:flutter/material.dart';
import 'input_page.dart';
import 'pages/morning.dart';
import 'pages/evening.dart';
import 'pages/mental.dart';
import 'pages/emotional.dart';
import 'pages/financial.dart';
import 'pages/physical.dart';


void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/home',

      routes: {
        '/home' : (context)  => InputPage(),
        '/morning': (context) => Morning(),
        '/evening': (context) => Evening(),
        '/mental': (context) => Mental(),
        '/emotional': (context) => Emotional(),
        '/financial': (context) => Financial(),
        '/physical': (context) => Physical()
      },

      theme: //ThemeData.dark(),
      ThemeData.dark().copyWith(
        primaryColor: Color(0xFF0A0E21),
        scaffoldBackgroundColor: Color(0xFF0A0E21),
      ),
      // home: Morning(),
    );
  }
}


