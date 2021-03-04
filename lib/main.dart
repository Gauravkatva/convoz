import 'package:convoz/screens/lending.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(Home());
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Lending(),
      theme: ThemeData(
        canvasColor: Colors.transparent,
      ),
    );
  }
}
