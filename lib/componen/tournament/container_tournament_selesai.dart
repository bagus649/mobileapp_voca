// ignore_for_file: prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
// ignore_for_file: use_key_in_widget_constructors
// ignore_for_file: prefer_const_constructors

class TournamenSelesai extends StatelessWidget {
  final String imageUrl;
  final String title1;
  final String title2;
  final String title3;
  final String title4;

  TournamenSelesai({
    required this.imageUrl,
    required this.title1,
    required this.title2,
    required this.title3,
    required this.title4,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 16),
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(imageUrl),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.circular(8),
            ),
            margin: EdgeInsets.symmetric(horizontal: 0),
            child: Stack(
              alignment: Alignment.topLeft,
              children: [
                Container(
                  width: 200,
                  height: 164,
                  margin: EdgeInsets.only(left: 152),
                  padding: EdgeInsets.only(left: 8, top: 36, bottom: 24),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    gradient: LinearGradient(
                      colors: [
                        Color.fromRGBO(1, 76, 76, 1),
                        Color.fromRGBO(0, 128, 128, 1),
                        Color.fromRGBO(1, 145, 145, 1),
                      ],
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title1,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 6),
                      Text(
                        title2,
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      ),
                      SizedBox(height: 6),
                      Row(
                        children: [
                          Row(
                            children: [
                              Image.asset('assets/icons/cup.png',
                                  height: 16, width: 16),
                              SizedBox(width: 6),
                              Text(
                                title3,
                                style: TextStyle(
                                    fontSize: 10, color: Colors.white),
                              ),
                            ],
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          Row(
                            children: [
                              Image.asset('assets/icons/profile2user.png',
                                  height: 20, width: 20),
                              SizedBox(width: 6),
                              Text(
                                title4,
                                style: TextStyle(
                                    fontSize: 10, color: Colors.white),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Color(0xffC81717).withOpacity(0.8),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(8),
                      bottomRight: Radius.circular(8),
                    ),
                  ),
                  child: Text(
                    'Selesai',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
