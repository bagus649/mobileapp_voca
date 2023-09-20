import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TournamentCard extends StatelessWidget {
  final Map<String, String> tournamentData;

  TournamentCard({required this.tournamentData});

  @override
  Widget build(BuildContext context) {
    return Container(
      // margin: EdgeInsets.only(top: 120),
      child: Stack(
        children: [
          Container(
            height: 220,
            width: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(tournamentData['imagebg']!),
                fit: BoxFit.fill,
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
                                SvgPicture.asset('assets/images/game.svg'),
                                SizedBox(
                                  width: 8,
                                ),
                                Text(
                                  'Pubg Mobile',
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
                                SvgPicture.asset('assets/images/airdrop.svg'),
                                SizedBox(
                                  width: 8,
                                ),
                                Text(
                                  'Online',
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
                                SvgPicture.asset('assets/images/tanggal.svg'),
                                SizedBox(
                                  width: 8,
                                ),
                                Text(
                                  '11 Feb 2023 - 14 Feb 2023',
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
                                  'Rp 100.000,-',
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
                                    color: Colors.black.withOpacity(0.20))),
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
                                      backgroundImage:
                                          AssetImage(tournamentData['img3']!),
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
                                      backgroundImage:
                                          AssetImage(tournamentData['img2']!),
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
                                      backgroundImage:
                                          AssetImage(tournamentData['img1']!),
                                    ),
                                  ),
                                ),
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
                ],
              )),
        ],
      ),
    );
  }
}
