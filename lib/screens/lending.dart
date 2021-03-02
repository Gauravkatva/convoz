import 'dart:ui';

import 'package:convoz/components/button.dart';
import 'package:convoz/screens/home.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Lending extends StatefulWidget {
  @override
  _LendingState createState() => _LendingState();
}

class _LendingState extends State<Lending> {
  String _imagePath = "assets/lending.jpg";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(_imagePath),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            color: Colors.black.withOpacity(0.4),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  "CONVOZ",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 80,
                  ),
                ),
                button(
                    title: "STREAM NOW",
                    colors: [Colors.indigo[900], Colors.blue[900]],
                    textStyle: TextStyle(
                      color: Colors.white,
                    ),
                    onPressed: () {
                      Navigator.of(context).push(
                          CupertinoPageRoute(builder: (context) => HomePage()));
                    }),
                button(
                    title: "SIGN IN",
                    textStyle: TextStyle(
                      color: Colors.white,
                    ),
                    onPressed: () {
                      Navigator.of(context).push(
                          CupertinoPageRoute(builder: (context) => HomePage()));
                    }),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
