import 'package:agora_rtc_engine/rtc_engine.dart';
import 'package:bouncing_widget/bouncing_widget.dart';
import 'package:convoz/components/live_convo_other_person.dart';
import 'package:convoz/components/live_person.dart';
import 'package:flutter/material.dart';
import 'package:convoz/utils/settings.dart' as settings;
import 'package:google_fonts/google_fonts.dart';

class CallScreen extends StatefulWidget {
  String channelName;
  String imagePath;
  String name;
  CallScreen(
      {this.channelName = settings.Channel_Name, this.imagePath, this.name});
  @override
  _CallScreenState createState() => _CallScreenState();
}

class _CallScreenState extends State<CallScreen> {
  String _imagePath = "assets/home_bg.png";
  RtcEngine engine;
  bool _joined = false;
  int _remoteUid = null;
  bool _switch = false;
  bool muted = false;

  @override
  void dispose() {
    engine.leaveChannel();
    engine.destroy();
    super.dispose();
  }

  @override
  void initState() {
    muted = false;
    super.initState();
    initPlatformState();
  }

  Future<void> initPlatformState() async {
    // Create RTC client instance
    engine = await RtcEngine.create(settings.APP_ID);
    // Define event handler
    engine.setEventHandler(RtcEngineEventHandler(
        joinChannelSuccess: (String channel, int uid, int elapsed) {
      print('joinChannelSuccess ${channel} ${uid}');
      setState(() {
        _joined = true;
      });
    }, userJoined: (int uid, int elapsed) {
      print('userJoined ${uid}');
      setState(() {
        _remoteUid = uid;
      });
    }, userOffline: (int uid, UserOfflineReason reason) {
      print('userOffline ${uid}');
      setState(() {
        _remoteUid = null;
      });
    }));
    // Join channel 123
    await engine.enableAudio();
    await engine.setDefaultAudioRoutetoSpeakerphone(true);
    await engine.joinChannel(settings.Token, '123', null, 0);
  }

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
                            ],
                          ),
                          Row(
                            children: [
                              BouncingWidget(
                                onPressed: () {
                                  setState(() {
                                    muted = !muted;
                                  });
                                  engine.muteLocalAudioStream(muted);
                                },
                                child: Icon(
                                  muted
                                      ? Icons.mic_off_outlined
                                      : Icons.mic_none,
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(
                                width: 30,
                              ),
                              BouncingWidget(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: Icon(
                                  Icons.call_end,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ],
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
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          LivePerson(
                            imagePath: "assets/tai_lopez.png",
                            name: "Tai Lopez",
                            isTalking: true,
                          ),
                          LivePerson(
                            imagePath: "assets/elon.png",
                            name: "Elon Musk",
                            isTalking: false,
                          ),
                          LivePerson(
                            imagePath: "assets/alex.png",
                            name: "Alex Mehr",
                            isTalking: false,
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          LivePerson(
                            imagePath: "assets/ryan.png",
                            name: "Ryan Kumar",
                            isTalking: false,
                          ),
                          LivePerson(
                            imagePath: "assets/jeff.png",
                            name: "Jeff Bezos",
                            isTalking: false,
                          ),
                          LivePerson(
                            imagePath: "assets/kanye.png",
                            name: "Kanye West",
                            isTalking: false,
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
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          LiveConvoPerson(
                            imagePath: "assets/pitbull.png",
                            name: "Pitbull",
                          ),
                          LiveConvoPerson(
                            imagePath: "assets/a-rod.png",
                            name: "A-rod",
                          ),
                          LiveConvoPerson(
                            imagePath: "assets/ben.png",
                            name: "Ben Mallah",
                          ),
                          LiveConvoPerson(
                            imagePath: "assets/warren.png",
                            name: "Warren",
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          LiveConvoPerson(
                            imagePath: "assets/astrid.png",
                            name: "Astrid",
                          ),
                          LiveConvoPerson(
                            imagePath: "assets/filippa.png",
                            name: "Filippa",
                          ),
                          LiveConvoPerson(
                            imagePath: "assets/felix.png",
                            name: "Felix",
                          ),
                          LiveConvoPerson(
                            imagePath: "assets/marcus.png",
                            name: "Marcus",
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

  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     body: Center(
  //       child: Stack(
  //         children: [
  //           Container(
  //             constraints: BoxConstraints.expand(),
  //             decoration: BoxDecoration(
  //               image: DecorationImage(
  //                 image: AssetImage(
  //                   _imagePath,
  //                 ),
  //                 fit: BoxFit.cover,
  //               ),
  //             ),
  //           ),
  //           Padding(
  //             padding: const EdgeInsets.fromLTRB(15, 15, 15, 20),
  //             child: SafeArea(
  //               child: SingleChildScrollView(
  //                 physics: BouncingScrollPhysics(),
  //                 child: Column(
  //                   children: [
  //                     Row(
  //                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                       children: [
  //                         Row(
  //                           children: [
  //                             Icon(
  //                               Icons.menu,
  //                               color: Colors.white,
  //                             ),
  //                             SizedBox(
  //                               width: 30,
  //                             ),
  //                             Text(
  //                               "Audio Call",
  //                               style: GoogleFonts.lato(
  //                                 textStyle: TextStyle(
  //                                   color: Colors.white,
  //                                   fontSize: 20,
  //                                 ),
  //                               ),
  //                             ),
  //                           ],
  //                         ),
  //                         Row(
  //                           children: [
  //                             Icon(
  //                               Icons.favorite_border,
  //                               color: Colors.white,
  //                             ),
  //                             SizedBox(
  //                               width: 30,
  //                             ),
  //                             Icon(
  //                               Icons.search,
  //                               color: Colors.white,
  //                             ),
  //                           ],
  //                         ),
  //                       ],
  //                     ),
  //                   ],
  //                 ),
  //               ),
  //             ),
  //           ),
  //           Center(
  //             child: Column(
  //               mainAxisAlignment: MainAxisAlignment.center,
  //               children: [
  //                 Text(
  //                   widget.name,
  //                   style: GoogleFonts.lato(
  //                     textStyle: TextStyle(
  //                       color: Colors.white,
  //                       fontWeight: FontWeight.bold,
  //                       fontSize: 30,
  //                     ),
  //                   ),
  //                 ),
  //                 SizedBox(
  //                   height: 30,
  //                 ),
  //                 Container(
  //                   height: 150,
  //                   width: 150,
  //                   decoration: BoxDecoration(
  //                     borderRadius: BorderRadius.circular(150),
  //                     image: DecorationImage(
  //                       image: AssetImage(widget.imagePath),
  //                       fit: BoxFit.cover,
  //                     ),
  //                   ),
  //                 ),
  //               ],
  //             ),
  //           ),
  //           Positioned(
  //             child: Align(
  //               alignment: Alignment.bottomCenter,
  //               child: Container(
  //                 height: 100,
  //                 // color: Colors.white,
  //                 decoration: BoxDecoration(
  //                   gradient: LinearGradient(
  //                     begin: Alignment.topCenter,
  //                     end: Alignment.bottomCenter,
  //                     colors: [
  //                       Colors.black.withOpacity(0.2),
  //                       Colors.black.withOpacity(0.9),
  //                     ],
  //                   ),
  //                 ),
  //                 child: Row(
  //                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  //                   children: [
  //                     BouncingWidget(
  //                       onPressed: () {
  //                         Navigator.of(context).pop();
  //                       },
  //                       child: Container(
  //                         height: 60,
  //                         width: 60,
  //                         decoration: BoxDecoration(
  //                           borderRadius: BorderRadius.circular(30),
  //                           gradient: LinearGradient(
  //                             colors: [
  //                               Colors.pink[400],
  //                               Colors.redAccent[200],
  //                             ],
  //                           ),
  //                         ),
  //                         child: Center(
  //                           child: Icon(
  //                             Icons.call_end,
  //                             color: Colors.white,
  //                           ),
  //                         ),
  //                       ),
  //                     ),
  //                     BouncingWidget(
  //                       onPressed: () {
  //                         setState(() {
  //                           muted = !muted;
  //                         });
  //                         engine.muteLocalAudioStream(muted);
  //                       },
  //                       child: Container(
  //                         height: 60,
  //                         width: 60,
  //                         decoration: BoxDecoration(
  //                           borderRadius: BorderRadius.circular(30),
  //                           gradient: LinearGradient(
  //                             colors: [
  //                               Colors.blue[400],
  //                               Colors.indigo[400],
  //                             ],
  //                           ),
  //                         ),
  //                         child: Center(
  //                           child: Icon(
  //                             muted ? Icons.mic_off : Icons.mic,
  //                             color: Colors.white,
  //                           ),
  //                         ),
  //                       ),
  //                     ),
  //                   ],
  //                 ),
  //               ),
  //             ),
  //           ),
  //         ],
  //       ),
  //     ),
  //   );
  // }
}
