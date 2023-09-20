// ignore_for_file: use_key_in_widget_constructors
// ignore_for_file: prefer_const_constructors
// ignore: avoid_unnecessary_containers
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomService extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Container(
            margin: EdgeInsets.only(left: 16),
            width: 176,
            height: 26,
            decoration: BoxDecoration(
              color: Color.fromRGBO(26, 199, 29, 1),
              borderRadius: BorderRadius.circular(50),
            ),
            child: Row(
              children: [
                Container(
                  width: 40,
                  height: 40,
                  padding: EdgeInsets.all(4),
                  child: SvgPicture.asset('assets/icons/headphones.svg'),
                ),
                Text(
                  'Customer Service 24/7',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 20),
            width: 124,
            height: 26,
            decoration: BoxDecoration(
              color: Color.fromRGBO(26, 199, 29, 1),
              borderRadius: BorderRadius.circular(50),
            ),
            child: Row(
              children: [
                Container(
                  width: 40,
                  height: 40,
                  padding: EdgeInsets.all(4),
                  child: SvgPicture.asset('assets/icons/shieldcheck.svg'),
                ),
                Text(
                  'Topup Aman',
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
    );
  }
}
