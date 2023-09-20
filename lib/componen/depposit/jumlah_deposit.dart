// ignore_for_file: use_key_in_widget_constructors
// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class JumlahDeposit extends StatelessWidget {
  final String jumlah_deposit;

  JumlahDeposit({
    required this.jumlah_deposit,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(4),
      // width: 140,
      child: Column(
        children: [
          Container(
            height: 80,
            width: 152,
            // margin: EdgeInsets.all(8),
            // padding: EdgeInsets.only(),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: Color(0xff008080),
            ),
            // height: 180,
            child: Stack(
              children: [
                Positioned(
                  left: 12,
                  right: 0,
                  top: 0,
                  child: Container(
                    // color: Colors.amber,
                    width: 152,
                    child: SvgPicture.asset(
                      'assets/images/Intersect.svg',
                      width: 60,
                      height: 56,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                Positioned(
                  child: Container(
                    margin: EdgeInsets.only(bottom: 20, left: 12),
                    alignment: Alignment.centerLeft,
                    // margin: EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'Rp. $jumlah_deposit',
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  left: 0,
                  right: 0,
                  bottom: 0,
                  child: Container(
                    height: 24,
                    decoration: BoxDecoration(
                      color: Color(0xFF1AC727).withOpacity(0.27),
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(16),
                        bottomRight: Radius.circular(16),
                      ),
                    ),
                    child: Row(
                      // mainAxisAlignment: MainAxisAlignment.center,
                      // crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          margin: EdgeInsets.only(left: 12),
                          child: Text(
                            'Deposit',
                            style: TextStyle(fontSize: 12, color: Colors.white),
                          ),
                        ),
                        Spacer(),
                        Container(
                          margin: EdgeInsets.only(right: 12),
                          child: Image.asset(
                            'assets/icons/deposit2.png',
                            width: 16,
                            height: 16,
                          ),
                        ),
                      ],
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
