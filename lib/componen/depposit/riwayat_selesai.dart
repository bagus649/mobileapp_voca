import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// ignore_for_file: use_key_in_widget_constructors
// ignore_for_file: prefer_const_constructors

class RiwayatContainer extends StatelessWidget {
  final String date;
  final String imagePath;
  final String title;
  final String status;
  final String amount;
  final int colorstatus;

  RiwayatContainer({
    required this.date,
    required this.imagePath,
    required this.title,
    required this.status,
    required this.amount,
    required this.colorstatus,
  });

  @override
  Widget build(BuildContext context) {
    Color statusColor = Color(colorstatus);
    return Container(
      margin: EdgeInsets.only(top: 16),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Color(0xff9396AE).withOpacity(0.28),
            blurRadius: 10,
            spreadRadius: 0.01,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 4),
          Container(
            width: double.infinity,
            padding: EdgeInsets.only(bottom: 4),
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: Colors.black38,
                  width: 1,
                ),
              ),
            ),
            child: Text(
              date,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(height: 4),
          Container(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  child: Image.asset(imagePath),
                ),
                Container(
                  margin: EdgeInsets.only(left: 4, bottom: 2),
                  child: Text(
                    title,
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                )
              ],
            ),
          ),
          SizedBox(height: 4),
          Container(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: statusColor,
                  ),
                  child: Text(
                    status,
                    style: TextStyle(fontSize: 12, color: Colors.white),
                  ),
                ),
                SizedBox(width: 12),
                Container(
                  margin: EdgeInsets.only(bottom: 4),
                  child: Text(
                    amount,
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.green,
                        fontWeight: FontWeight.w500),
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
