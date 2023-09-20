import 'package:flutter/material.dart';
import 'package:mobile/componen/tournament/provider_tournament.dart';

import 'package:provider/provider.dart';

import '../../halaman/halaman_detail_tournament.dart';

class TournamenMendatang extends StatelessWidget {
  final String imageUrl;
  final String imagebg;
  final String img1;
  final String img2;
  final String img3;
  final String game;
  final String status;
  final String tanggal;
  final String biaya;
  final String title1;
  final String title2;
  final String title3;
  final String title4;

  TournamenMendatang({
    required this.imageUrl,
    required this.imagebg,
    required this.img1,
    required this.img2,
    required this.img3,
    required this.game,
    required this.status,
    required this.tanggal,
    required this.biaya,
    required this.title1,
    required this.title2,
    required this.title3,
    required this.title4,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(
            bottom: 20,
            left: 20,
            right: 20,
          ),
          height: 220,
          decoration: BoxDecoration(
            color: Colors.black,
            image: DecorationImage(
              image: AssetImage(imagebg),
              opacity: 0.8,
              fit: BoxFit.cover,
            ),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Stack(
            children: [
              Positioned(
                left: 16,
                top: 16,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset(
                      imageUrl,
                      width: 50,
                      height: 50,
                    ),
                  ],
                ),
              ),
              Positioned(
                right: 16,
                top: 16,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    SizedBox(height: 8),
                    Text(
                      title1,
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(30.0),
                      child: ElevatedButton(
                        onPressed: () {
                          final tournamentDataNotifier =
                              Provider.of<TournamentDataProvider>(context,
                                  listen: false);

                          tournamentDataNotifier.setData({
                            'imageUrl': imageUrl,
                            'game': game,
                            'status': status,
                            'tanggal': tanggal,
                            'biaya': biaya,
                            'title1': title1,
                            'title2': title2,
                            'title3': title3,
                            'title4': title4,
                            'imagebg': imagebg,
                            'img1': img1,
                            'img2': img2,
                            'img3': img3,
                          });

                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => TournamentDetailPage(
                                  tournamentData:
                                      tournamentDataNotifier.tournamentData),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.transparent,
                          onPrimary: Colors.white,
                          side: BorderSide(
                            color: Colors.white,
                            width: 2.0,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: Text(
                          'Register Now',
                          style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                bottom: 12,
                left: 16,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title2,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
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
                              title3,
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
                                backgroundImage: AssetImage(img3),
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
                                backgroundImage: AssetImage(img2),
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
                                backgroundImage: AssetImage(img1),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: 16,
                            height: 16,
                            child: Image.asset(
                              'assets/icons/cup.png',
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(width: 16),
                          Text(
                            title4,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
