import 'package:flutter/material.dart';
import 'package:wheels_app/selectionScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Wheels App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SelectionScreen(), 
    );
  }
}

