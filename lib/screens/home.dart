import 'dart:ui';

import 'package:bouncing_widget/bouncing_widget.dart';
import 'package:convoz/components/live_convoz.dart';
import 'package:convoz/components/person.dart';
import 'package:convoz/components/story.dart';
import 'package:convoz/components/trending_convoz.dart';
import 'package:convoz/screens/live_convo.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String _imagePath = "assets/home_bg.png";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Stack(
          children: [
            Container(
              constraints: BoxConstraints.expand(),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    _imagePath,
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(15, 15, 15, 20),
              child: SafeArea(
                child: SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.menu,
                                color: Colors.white,
                              ),
                              SizedBox(
                                width: 30,
                              ),
                              Text(
                                "Listen Now",
                                style: GoogleFonts.lato(
                                  textStyle: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.favorite_border,
                                color: Colors.white,
                              ),
                              SizedBox(
                                width: 30,
                              ),
                              Icon(
                                Icons.search,
                                color: Colors.white,
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      SingleChildScrollView(
                        physics: BouncingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            Column(
                              children: [
                                BouncingWidget(
                                  onPressed: () {},
                                  child: Container(
                                    height: 60,
                                    width: 60,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(30),
                                      gradient: LinearGradient(
                                        colors: [
                                          Colors.indigo[800],
                                          Colors.blue[800],
                                        ],
                                      ),
                                    ),
                                    child: Center(
                                      child: Icon(
                                        Icons.add,
                                        color: Colors.white,
                                        size: 30,
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 8,
                                ),
                                Text(
                                  "Add New",
                                  style: GoogleFonts.lato(
                                    textStyle: TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Story(
                              imagePath: "assets/jeff.png",
                              name: "Jeff bezos",
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Story(
                              imagePath: "assets/oprah.png",
                              name: "Oprah",
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Story(
                              imagePath: "assets/bill.jpeg",
                              name: "Bill Gates",
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Story(
                              imagePath: "assets/warren.png",
                              name: "Warren Buffet",
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Story(
                              imagePath: "assets/elon.png",
                              name: "Elon Musk",
                            ),
                            SizedBox(
                              width: 10,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Live Convoz",
                            style: GoogleFonts.lato(
                              textStyle: TextStyle(
                                color: Colors.white,
                                fontSize: 30,
                              ),
                            ),
                          ),
                          Icon(
                            Icons.keyboard_arrow_right,
                            color: Colors.white,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        physics: BouncingScrollPhysics(),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            LiveConvoz(
                              imagePath: "assets/tai_lopez.png",
                              views: "2 M",
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            LiveConvoz(
                              imagePath: "assets/bill.jpeg",
                              views: "6.1 M",
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            LiveConvoz(
                              imagePath: "assets/warren.png",
                              views: "3.2 M",
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      BouncingWidget(
                        scaleFactor: 2,
                        onPressed: () {},
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Trending Convoz",
                              style: GoogleFonts.lato(
                                textStyle: TextStyle(
                                  color: Colors.white,
                                  fontSize: 30,
                                ),
                              ),
                            ),
                            BouncingWidget(
                              scaleFactor: 2,
                              onPressed: () {},
                              child: Icon(
                                Icons.keyboard_arrow_right,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TrendingConvoz(
                        imagePath: "assets/alex.png",
                        views: "1.2M",
                        title: "Scaling to IPO in CRE",
                        name: "Alex Mehr",
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TrendingConvoz(
                        imagePath: "assets/elon.png",
                        views: "3.12M",
                        title: "Innovation in Tech",
                        name: "Elon Musk",
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TrendingConvoz(
                        imagePath: "assets/bill.jpeg",
                        views: "21k",
                        title: "Straight Line Sales",
                        name: "Bill Gates",
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TrendingConvoz(
                        imagePath: "assets/warren.png",
                        views: "2 M",
                        title: "Invest Right",
                        name: "Warren Buffet",
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TrendingConvoz(
                        imagePath: "assets/oprah.png",
                        views: "25 M",
                        title: "Fashion",
                        name: "Oprah",
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  height: 100,
                  // color: Colors.white,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.black.withOpacity(0.2),
                        Colors.black.withOpacity(0.9),
                      ],
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      BouncingWidget(
                        onPressed: () {},
                        child: Container(
                          height: 48,
                          width: 48,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(24),
                            gradient: LinearGradient(
                              colors: [
                                Colors.pink[400],
                                Colors.redAccent[200],
                              ],
                            ),
                          ),
                          child: Center(
                            child: Icon(
                              Icons.wifi_tethering,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      BouncingWidget(
                        onPressed: () {},
                        child: Container(
                          height: 48,
                          width: 48,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(24),
                          ),
                          child: Center(
                            child: Icon(
                              Icons.tv,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      BouncingWidget(
                        onPressed: () {
                          showSheet();
                        },
                        child: Container(
                          height: 48,
                          width: 48,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(24),
                          ),
                          child: Center(
                            child: Icon(
                              Icons.search,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      BouncingWidget(
                        onPressed: () {},
                        child: Container(
                          height: 48,
                          width: 48,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(24),
                          ),
                          child: Center(
                            child: Icon(
                              Icons.person_outline_outlined,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void showSheet() {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
          child: Container(
            decoration: BoxDecoration(
              color: Color(0xff282A3B),
              borderRadius: BorderRadius.only(
                  topLeft: const Radius.circular(40),
                  topRight: const Radius.circular(40)),
            ),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(30, 30, 30, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Start with people",
                    style: GoogleFonts.lato(
                      textStyle: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    // mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Person(
                        imagePath: "assets/add.png",
                        name: "",
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Person(
                        imagePath: "assets/ex1.png",
                        name: "",
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Person(
                        imagePath: "assets/ex2.png",
                        name: "",
                      ),
                    ],
                  ),
                  Text(
                    "Start Broad Casting",
                    style: GoogleFonts.lato(
                      textStyle: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: 60,
                    child: Row(
                      children: [
                        Container(
                          height: 60,
                          width: 60,
                          decoration: BoxDecoration(
                            color: Colors.greenAccent.withOpacity(0.3),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Center(
                            child: Icon(
                              Icons.add,
                              color: Colors.greenAccent,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Start New Audio Convo",
                              style: GoogleFonts.lato(
                                textStyle: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                ),
                              ),
                            ),
                            Text(
                              "32Mb March 14, 2021",
                              style: GoogleFonts.lato(
                                textStyle: TextStyle(
                                  color: Colors.grey,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 60,
                    child: Row(
                      children: [
                        Container(
                          height: 60,
                          width: 60,
                          decoration: BoxDecoration(
                            color: Colors.yellowAccent.withOpacity(0.3),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Center(
                            child: Icon(
                              Icons.music_note,
                              color: Colors.yellow,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Row(
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Audio Story",
                                  style: GoogleFonts.lato(
                                    textStyle: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                    ),
                                  ),
                                ),
                                Text(
                                  "32Mb March 14, 2021",
                                  style: GoogleFonts.lato(
                                    textStyle: TextStyle(
                                      color: Colors.grey,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              width: 70,
                            ),
                            BouncingWidget(
                              onPressed: () {},
                              scaleFactor: 3,
                              child: Icon(
                                Icons.close,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 60,
                    child: Row(
                      children: [
                        Container(
                          height: 60,
                          width: 60,
                          decoration: BoxDecoration(
                            color: Colors.blueAccent.withOpacity(0.3),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Center(
                            child: Icon(
                              Icons.add,
                              color: Colors.blueAccent,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Row(
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Audio Draft",
                                  style: GoogleFonts.lato(
                                    textStyle: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                    ),
                                  ),
                                ),
                                Text(
                                  "9.6Mb March 12, 2021",
                                  style: GoogleFonts.lato(
                                    textStyle: TextStyle(
                                      color: Colors.grey,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              width: 70,
                            ),
                            BouncingWidget(
                              onPressed: () {},
                              scaleFactor: 3,
                              child: Icon(
                                Icons.close,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
