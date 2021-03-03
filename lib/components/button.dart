import 'package:flutter/material.dart';
import 'package:bouncing_widget/bouncing_widget.dart';

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
  return BouncingWidget(
    onPressed: onPressed,
    child: Container(
      width: 150,
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
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
