import 'dart:math';

import 'package:flutter/material.dart';

// ignore: camel_case_types
class First_Screen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
        color: Colors.lightBlue,
        child: Center(
          child: Text(
            generateLuckyNumber(),
            textDirection: TextDirection.ltr,
            style: TextStyle(color: Colors.white, fontSize: 30.0),
          ),
        ));
  }

  String generateLuckyNumber() {
    var random = Random();
    int luckyNumber = random.nextInt(10);
    return "YOur lucky Number $luckyNumber";
  }
}
