// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class CardProduk extends StatelessWidget {
  final String imageUrl;

  final String title1;
  final String title2;

  CardProduk({
    required this.imageUrl,
    required this.title1,
    required this.title2,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Container(
        width: 124,
        height: 200,
        margin: EdgeInsets.symmetric(horizontal: 3),
        decoration: BoxDecoration(
          color: Colors.black,
          border: Border.all(color: Color.fromRGBO(208, 208, 208, 100)),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          children: [
            Expanded(
              child: Container(
                child: Column(
                  children: [
                    ClipPath(
                      clipper: CustomWaveClipper(),
                      child: Container(
                        height: 112,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(imageUrl),
                            fit: BoxFit.cover,
                          ),
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(8),
                            topRight: Radius.circular(8),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 4),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            padding: EdgeInsets.only(top: 8),
                            child: Text.rich(
                              TextSpan(
                                text: '30 (12+1) Diamonds',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(top: 8),
                            alignment: Alignment.centerLeft,
                            width: double.infinity,
                            child: Text.rich(
                              TextSpan(
                                text: title1,
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Row(
                            children: [
                              Image.asset(
                                'assets/images/vocagame_hijau.png',
                                height: 20,
                              ),
                              Spacer(),
                              Container(
                                child: Column(
                                  children: [
                                    Text(
                                      'Rp. 39.000',
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: Colors.red,
                                        decoration: TextDecoration.lineThrough,
                                        decorationColor: Colors.red,
                                        decorationThickness: 2,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      title2,
                                      style: TextStyle(
                                          fontSize: 12,
                                          color: Color(0xff17C82A)),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),

                    // SizedBox(height: 10),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    ]);
  }
}

class CustomWaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    final curveHeight = 12.0;

    path.lineTo(0, size.height);
    final firstControlPoint = Offset(size.width / 4, size.height);
    final firstEndPoint = Offset(size.width / 2, size.height - curveHeight);
    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
        firstEndPoint.dx, firstEndPoint.dy);

    final secondControlPoint =
        Offset(size.width * 3 / 4, size.height - 2 * curveHeight);
    final secondEndPoint = Offset(size.width - 0, size.height - curveHeight);
    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
        secondEndPoint.dx, secondEndPoint.dy);

    path.lineTo(size.width, 0);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
