import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Story extends StatelessWidget {
  String imagePath;
  String name;
  Story({this.imagePath, this.name});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 60,
          width: 60,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            image: DecorationImage(
              image: AssetImage(
                imagePath,
              ),
              fit: BoxFit.cover,
            ),
          ),
        ),
        SizedBox(
          height: 8,
        ),
        Text(
          name,
          style: GoogleFonts.lato(
            textStyle: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}
