import 'package:flutter/material.dart';

Widget button(
    {String title,
    List<Color> colors,
    TextStyle textStyle,
    @required Function onPressed}) {
  if (colors == null) {
    colors = [Colors.transparent, Colors.transparent];
  }
  if (textStyle == null) {
    textStyle = TextStyle(
      color: Colors.white,
    );
  }
  return InkWell(
    onTap: onPressed,
    child: Container(
      width: 150,
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: colors,
        ),
      ),
      child: Center(
        child: Text(
          title,
          style: textStyle,
        ),
      ),
    ),
  );
}
