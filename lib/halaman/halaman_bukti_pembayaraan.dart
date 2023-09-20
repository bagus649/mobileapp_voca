// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:custom_clippers/custom_clippers.dart';

import 'Navigation/Bottom_Navigation.dart';

class BuktiPembayaraan extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Color(0xff17C82A),
      //   elevation: 0,
      //   title: Center(
      //       child: Container(
      //     padding: EdgeInsets.only(right: 40),
      //     child: Text(
      //       'Bukti Pembayaraan',
      //       style: TextStyle(
      //         color: Colors.white,
      //         fontSize: 18,
      //         fontWeight: FontWeight.bold,
      //       ),
      //     ),
      //   )),
      // ),
      extendBodyBehindAppBar: true,
      body: Container(
        height: double.infinity,
        color: Colors.black.withOpacity(0.04),
        child: SingleChildScrollView(
          // padding: EdgeInsets.all(16.0),
          child: Stack(
            children: [
              Container(
                child: SvgPicture.asset(
                  'assets/images/ribbons.svg',
                ),
              ),
              Column(children: [
                Container(
                  // color: Colors.amber,
                  height: 88,
                ),
                ClipPath(
                  clipper: MultipleRoundedPointsClipper(Sides.vertical,
                      heightOfPoint: 40, numberOfPoints: 12),
                  clipBehavior: Clip.antiAlias,
                  child: Container(
                    height: 540,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      // boxShadow: [
                      //   BoxShadow(
                      //     color: Colors.white,
                      //     blurRadius: 10,
                      //     spreadRadius: 0.2,
                      //   ),
                      // ],
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    margin: EdgeInsets.only(
                        left: 16, right: 16, bottom: 12, top: 12),
                    alignment: Alignment.center,
                    child: Column(
                      children: [
                        SizedBox(
                          height: 56,
                        ),
                        Text(
                          'Pesanan Berhasil',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            // color: Color(0xFF17C82A),
                          ),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Container(
                          alignment: Alignment.center,
                          width: 320,
                          child: Text(
                              'Pembayaraan kamu sukses dan terimakasih sudah melakukan Topup di VocaGame',
                              style: TextStyle(
                                fontSize: 16,
                                color: Color(0xff8F92A1),
                              ),
                              textAlign: TextAlign.center),
                        ),
                        SizedBox(
                          height: 28,
                        ),
                        Container(
                          child: Row(
                            children: [
                              Text(
                                'Tanggal :',
                                style: TextStyle(
                                    fontSize: 16,
                                    color: Color(0xff8F92A1),
                                    fontWeight: FontWeight.bold),
                              ),
                              Spacer(),
                              Text(
                                '13 Februari 2023 • 3:02 PM',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Color(0xff8F92A1),
                                ),
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
                              Text(
                                'Kode Pembayaraan :',
                                style: TextStyle(
                                    fontSize: 16,
                                    color: Color(0xff8F92A1),
                                    fontWeight: FontWeight.bold),
                              ),
                              Spacer(),
                              Text(
                                'VCA780237',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Color(0xff8F92A1),
                                ),
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
                              Text(
                                'No Invoice :',
                                style: TextStyle(
                                    fontSize: 16,
                                    color: Color(0xff8F92A1),
                                    fontWeight: FontWeight.bold),
                              ),
                              Spacer(),
                              Text(
                                'MLBB-16749793207770',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Color(0xff8F92A1),
                                ),
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
                              Text(
                                'Jenis Pembayaran :',
                                style: TextStyle(
                                    fontSize: 16,
                                    color: Color(0xff8F92A1),
                                    fontWeight: FontWeight.bold),
                              ),
                              Spacer(),
                              Text(
                                'Voca Credit',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Color(0xff8F92A1),
                                ),
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
                              Text(
                                'Metode Pembayaran :',
                                style: TextStyle(
                                    fontSize: 16,
                                    color: Color(0xff8F92A1),
                                    fontWeight: FontWeight.bold),
                              ),
                              Spacer(),
                              Text(
                                'Alfamart',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Color(0xff8F92A1),
                                ),
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
                              Text(
                                'Total Pembayaraan :',
                                style: TextStyle(
                                    fontSize: 16,
                                    color: Color(0xff8F92A1),
                                    fontWeight: FontWeight.bold),
                              ),
                              Spacer(),
                              Text(
                                'Rp. 50.000,-',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Color(0xff8F92A1),
                                ),
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
                              Text(
                                'Pada Akun :',
                                style: TextStyle(
                                    fontSize: 16,
                                    color: Color(0xff8F92A1),
                                    fontWeight: FontWeight.bold),
                              ),
                              Spacer(),
                              Text(
                                'Syauqizaidan Khairan Khalaf',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Color(0xff8F92A1),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          padding:
                              EdgeInsets.symmetric(horizontal: 4, vertical: 12),
                          child: CustomPaint(
                            painter: DashedLinePainter(),
                            child: SizedBox(width: double.infinity),
                          ),
                        ),
                        Container(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Informasi Transaksi',
                            style: TextStyle(
                                fontSize: 16,
                                color: Color(0xff8F92A1),
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                              color: Color(0xff8F92A1).withOpacity(0.1),
                              borderRadius: BorderRadius.circular(16)),
                          margin: EdgeInsets.symmetric(vertical: 16),
                          padding: EdgeInsets.symmetric(
                              horizontal: 16, vertical: 20),
                          child: Row(
                            children: [
                              Container(
                                height: 40,
                                child: Image.asset(
                                  'assets/images/diamond.png',
                                  fit: BoxFit.fill,
                                ),
                              ),
                              SizedBox(
                                width: 4,
                              ),
                              Container(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      '172 Diamonds (156 + 16 Bonus)',
                                      style: TextStyle(
                                          fontSize: 16,
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(
                                      height: 4,
                                    ),
                                    Text(
                                      'Rp 12.600,-',
                                      style: TextStyle(
                                        fontSize: 16,
                                        color: Color(0xff8F92A1),
                                      ),
                                    ),
                                    Text(
                                      '4 Februari 2023 / 15:02',
                                      style: TextStyle(
                                        fontSize: 16,
                                        color: Color(0xff8F92A1),
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  child: Column(
                    children: [
                      TextButton(
                        onPressed: () {
                          Navigator.pop(
                            context,
                          );
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              vertical: 16, horizontal: 102),
                          child: Text(
                            'Kembali',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                          decoration: BoxDecoration(
                            color: Color(0xff17C82A),
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => BottomNavigasion()));
                        },
                        child: Container(
                          alignment: Alignment.center,
                          child: Text(
                            'Kembali Ke Beranda',
                            style: TextStyle(
                              color: Color(0xff8F92A1),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ]),
              Positioned(
                  left: 0,
                  right: 0,
                  top: 60,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Container(
                        height: 40,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                        ),
                        // margin: EdgeInsets.all(180),
                      ),
                      Image.asset(
                        'assets/images/success.png',
                      ),
                    ],
                  )),
            ],
          ),
        ),
      ),
    );
  }
}

class DashedLinePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = Color(0xffE0E0E0)
      ..strokeWidth = 2.0
      ..strokeCap = StrokeCap.round;

    const double dashWidth = 5.0;
    const double dashSpace = 5.0;

    double startX = 0.0;

    while (startX < size.width) {
      canvas.drawLine(
        Offset(startX, 0),
        Offset(startX + dashWidth, 0),
        paint,
      );

      startX += dashWidth + dashSpace;
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldPainter) {
    return true;
  }
}
