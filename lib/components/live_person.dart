import 'package:bouncing_widget/bouncing_widget.dart';
import 'package:convoz/screens/call_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LivePerson extends StatelessWidget {
  String imagePath;
  bool isLive;
  String name;
  LivePerson({this.imagePath, this.isLive, this.name});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Text(
            isLive ? "Online" : "Offline",
            style: GoogleFonts.lato(
              textStyle: TextStyle(
                color: isLive ? Colors.green : Colors.redAccent,
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          BouncingWidget(
            onPressed: isLive
                ? () {
                    Navigator.of(context).push(CupertinoPageRoute(
                        builder: (context) => CallScreen(
                              imagePath: imagePath,
                              name: name,
                            )));
                  }
                : () {},
            scaleFactor: 2,
            child: Container(
              height: 80,
              width: 80,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  image: AssetImage(imagePath),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            name,
            style: GoogleFonts.lato(
              textStyle: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
