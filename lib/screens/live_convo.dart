import 'package:bouncing_widget/bouncing_widget.dart';
import 'package:convoz/components/live_person.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LiveConvo extends StatefulWidget {
  @override
  _LiveConvoState createState() => _LiveConvoState();
}

class _LiveConvoState extends State<LiveConvo> {
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
                                "Live Convo",
                                style: GoogleFonts.lato(
                                  textStyle: TextStyle(
                                    color: Colors.white,
                                    fontSize: 24,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        height: 20,
                        width: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          gradient: LinearGradient(
                            colors: [
                              Colors.pink[400],
                              Colors.redAccent[200],
                            ],
                          ),
                        ),
                        child: Center(
                          child: Text(
                            "LIVE",
                            style: GoogleFonts.lato(
                              textStyle: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          LivePerson(
                            imagePath: "assets/elon.png",
                            name: "Elon Musk",
                            isTalking: true,
                          ),
                          LivePerson(
                            imagePath: "assets/jeff.png",
                            name: "Jeff Bezos",
                            isTalking: false,
                          ),
                          LivePerson(
                            imagePath: "assets/bill.jpeg",
                            name: "Bill Gates",
                            isTalking: false,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          LivePerson(
                            imagePath: "assets/warren.png",
                            name: "Warren Buffet",
                            isTalking: false,
                          ),
                          LivePerson(
                            imagePath: "assets/oprah.png",
                            name: "Oprah",
                            isTalking: false,
                          ),
                          LivePerson(
                            imagePath: "assets/ryan.png",
                            name: "Ryan Kumar",
                            isTalking: false,
                          ),
                        ],
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
                            gradient: LinearGradient(
                              colors: [
                                Colors.pink[400],
                                Colors.redAccent[200],
                              ],
                            ),
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
                        onPressed: () {},
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
}
