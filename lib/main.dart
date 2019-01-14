import 'package:flutter/material.dart';
import 'package:calculator_app/home_page.dart';

void main() => runApp(MainPage());

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  } 
}