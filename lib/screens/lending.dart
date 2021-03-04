import 'dart:ui';
import 'package:google_fonts/google_fonts.dart';
import 'package:convoz/components/button.dart';
import 'package:convoz/screens/home.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

class Lending extends StatefulWidget {
  @override
  _LendingState createState() => _LendingState();
}

class _LendingState extends State<Lending> {
  String _imagePath = "assets/lending.png";

  Future<void> onJoin() async {
    // await for camera and mic permissions before pushing video page
    await _handleCameraAndMic(Permission.microphone);
    var micStatus = await Permission.microphone.status;
    // push video page with given channel name
    if (micStatus.isGranted) {
      Navigator.of(context)
          .push(CupertinoPageRoute(builder: (context) => HomePage()));
    }
  }

  Future<void> _handleCameraAndMic(Permission permission) async {
    final status = await permission.request();
    print(status);
  }

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
                  style: GoogleFonts.lato(
                    textStyle: TextStyle(
                      color: Colors.white,
                      fontSize: 80,
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                button(
                  title: "STREAM NOW",
                  colors: [Colors.indigo[900], Colors.blue[900]],
                  textStyle: TextStyle(
                    color: Colors.white,
                  ),
                  onPressed: onJoin,
                ),
                SizedBox(
                  height: 15,
                ),
                button(
                  title: "SIGN IN",
                  textStyle: TextStyle(
                    color: Colors.white,
                  ),
                  onPressed: onJoin,
                ),
                SizedBox(
                  height: 15,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
