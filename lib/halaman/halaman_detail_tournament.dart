import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../bottom_navigasion_controller/tab_bar_detail_tournamen_controller.dart';
import '../componen/tab_bar_view/tournamen/gabung_tournament.dart';

class TournamentDetailPage extends StatelessWidget {
  final Map<String, String> tournamentData;

  const TournamentDetailPage({required this.tournamentData});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Text('Tournament Detail'),
        centerTitle: true,
      ),
      extendBodyBehindAppBar: true,
      body: Container(
        height: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            // crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Stack(
                children: [
                  Container(
                    height: 460,
                    child: Stack(
                      children: [
                        Image.asset(
                          tournamentData['imagebg']!,
                          fit: BoxFit.fitHeight,
                          height: 460,
                        ),
                        BackdropFilter(
                          filter: ImageFilter.blur(sigmaX: 0, sigmaY: 0),
                          child: Container(
                            color: Colors.transparent,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 404,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(tournamentData['imagebg']!),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Container(
                      // color: Colors.amber,
                      margin: EdgeInsets.only(top: 120),
                      child: Stack(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.rectangle,
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Color(0xff9396AE).withOpacity(0.28),
                                  blurRadius: 10,
                                  spreadRadius: 0.01,
                                ),
                              ],
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            margin: EdgeInsets.only(
                              top: 20,
                              left: 20,
                              right: 20,
                            ),
                            alignment: Alignment.center,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 20),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    height: 12,
                                  ),
                                  Text(
                                    tournamentData['title2']!,
                                    style: TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 12,
                                  ),
                                  Container(
                                    child: Row(
                                      children: [
                                        SvgPicture.asset(
                                            'assets/images/game.svg'),
                                        SizedBox(
                                          width: 8,
                                        ),
                                        Text(
                                          tournamentData['game']!,
                                          style: TextStyle(
                                              fontSize: 12,
                                              color: Color(0xff747688),
                                              fontWeight: FontWeight.w500),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 8,
                                  ),
                                  Container(
                                    child: Row(
                                      children: [
                                        SvgPicture.asset(
                                            'assets/images/airdrop.svg'),
                                        SizedBox(
                                          width: 8,
                                        ),
                                        Text(
                                          tournamentData['status']!,
                                          style: TextStyle(
                                              fontSize: 12,
                                              color: Color(0xff747688),
                                              fontWeight: FontWeight.w500),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 8,
                                  ),
                                  Container(
                                    child: Row(
                                      children: [
                                        SvgPicture.asset(
                                            'assets/images/tanggal.svg'),
                                        SizedBox(
                                          width: 8,
                                        ),
                                        Text(
                                          tournamentData['tanggal']!,
                                          style: TextStyle(
                                              fontSize: 12,
                                              color: Color(0xff747688),
                                              fontWeight: FontWeight.w500),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 8,
                                  ),
                                  Container(
                                    child: Row(
                                      children: [
                                        Image.asset('assets/images/biaya.png'),
                                        SizedBox(
                                          width: 8,
                                        ),
                                        Text(
                                          tournamentData['biaya']!,
                                          style: TextStyle(
                                              fontSize: 12,
                                              color: Color(0xff747688),
                                              fontWeight: FontWeight.w500),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(top: 12, bottom: 4),
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            color: Colors.black
                                                .withOpacity(0.20))),
                                  ),
                                  Container(
                                    height: 36,
                                    width: 400,
                                    child: Stack(
                                      alignment: Alignment.centerRight,
                                      children: [
                                        Positioned(
                                          left: 68,
                                          child: Text(
                                            tournamentData['title3']!,
                                            style: TextStyle(
                                              color: Colors.green,
                                              fontSize: 12,
                                            ),
                                          ),
                                        ),
                                        Positioned(
                                          left: 32,
                                          child: CircleAvatar(
                                            radius: 12,
                                            backgroundColor: Colors.white,
                                            child: CircleAvatar(
                                              radius: 11,
                                              backgroundImage: AssetImage(
                                                  tournamentData['img3']!),
                                            ),
                                          ),
                                        ),
                                        Positioned(
                                          left: 16,
                                          child: CircleAvatar(
                                            radius: 12,
                                            backgroundColor: Colors.white,
                                            child: CircleAvatar(
                                              radius: 11,
                                              backgroundImage: AssetImage(
                                                  tournamentData['img2']!),
                                            ),
                                          ),
                                        ),
                                        Positioned(
                                          left: 0,
                                          child: CircleAvatar(
                                            radius: 12,
                                            backgroundColor: Colors.white,
                                            child: CircleAvatar(
                                              radius: 11,
                                              backgroundImage: AssetImage(
                                                  tournamentData['img1']!),
                                            ),
                                          ),
                                        ),
                                        GestureDetector(
                                          onTap: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    TournamentRegistrationPage(
                                                  tournamentData:
                                                      tournamentData,
                                                ),
                                              ),
                                            );
                                          },
                                          child: Container(
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(20.0),
                                              border: Border.all(
                                                  width: 2.0,
                                                  color: Color(0xff1AC727)),
                                            ),
                                            padding: EdgeInsets.symmetric(
                                                vertical: 4, horizontal: 12),
                                            child: Text(
                                              'Bergabung',
                                              style: TextStyle(
                                                fontSize: 12,
                                                color: Color(0xff1AC727),
                                              ),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Positioned(
                            top: 0,
                            left: 0,
                            right: 0,
                            child: Container(
                              margin: EdgeInsets.symmetric(horizontal: 100),
                              width: 200,
                              height: 40,
                              decoration: BoxDecoration(
                                shape: BoxShape.rectangle,
                                color: Color(0xffE9E9E9),
                                boxShadow: [
                                  BoxShadow(
                                    color: Color(0xff9396AE).withOpacity(0.28),
                                    blurRadius: 10,
                                    spreadRadius: 0.01,
                                  ),
                                ],
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    'assets/icons/cup.png',
                                    color: Colors.amber,
                                  ),
                                  SizedBox(
                                    width: 16,
                                  ),
                                  Text(
                                    tournamentData['title4']!,
                                    style: TextStyle(
                                        color: Color(0xff17C82A),
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Container(
                            // height: double.maxFinite,
                            margin: EdgeInsets.only(top: 288),
                            height: 740,

                            child: TabBarDetailTournamen1(
                              selectedTab: 0,
                            ),
                          ),
                        ],
                      )),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
