import 'dart:async';
import 'package:designcompetition/details.dart';
import 'package:flutter/material.dart';
import 'Home.dart';


void main()  {
  runApp(new schoolApp());
}

class schoolApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}