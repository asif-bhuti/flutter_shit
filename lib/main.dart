import "package:flutter/material.dart";
import 'screens/first_screen.dart';

void main() => runApp(Flutter_shit());

class Flutter_shit extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter App Shit',
        home: Scaffold(
            appBar: AppBar(
              title: Text('Flutter Shit'),
            ),
            body: First_Screen()));
  }
  }

