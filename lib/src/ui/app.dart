import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light(),
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text(
            "TEST",
            style: TextStyle(color: Colors.black),
          ),
        ),
        body: SafeArea(
          child: Center(),
        ),
      ),
    );
  }
}
