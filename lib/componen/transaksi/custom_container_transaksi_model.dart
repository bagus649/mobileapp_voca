import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
// ignore_for_file: use_key_in_widget_constructors
// ignore_for_file: prefer_const_constructors

class CustomContainerTransaksi1 extends StatelessWidget {
  final String tanggal;
  final String harga;
  final String gambar1;
  final String gambar2;
  final String svg1;
  final String judul;
  final String diamonds;
  final String buttonLabel;
  final Color buttonColor;
  final VoidCallback onPressed;

  CustomContainerTransaksi1({
    required this.tanggal,
    required this.harga,
    required this.gambar1,
    required this.gambar2,
    required this.svg1,
    required this.judul,
    required this.diamonds,
    required this.buttonLabel,
    required this.buttonColor,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(16),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                tanggal,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
              Text(
                harga,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
            ],
          ),
          SizedBox(height: 16),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                child: Image.asset(
                  gambar1,
                  height: 92,
                  width: 92,
                  fit: BoxFit.cover,
                ),
                margin: EdgeInsets.only(right: 16),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      judul,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),

                    Row(
                      children: [
                        Image.asset(gambar2),
                        SizedBox(width: 8),
                        Flexible(
                          child: Text(
                            diamonds,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 24,
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.chevron_right_sharp),
                        ),
                      ],
                    ),
                    Container(
                      height: 20,
                      child: Row(
                        children: [
                          SvgPicture.asset(
                            svg1,
                            width: 24,
                            height: 24,
                          ),
                          SizedBox(width: 8),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: buttonColor,
                              minimumSize: Size(36, 20),
                            ),
                            onPressed: () {},
                            child: Text(
                              buttonLabel,
                              style: TextStyle(
                                fontSize: 12,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    // SizedBox(height: 8),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
