import 'package:flutter/material.dart';

// ignore_for_file: use_key_in_widget_constructors
// ignore_for_file: prefer_const_constructors
// ignore: avoid_unnecessary_containers
class Panduan extends StatefulWidget {
  @override
  _PanduanState createState() => _PanduanState();
}

class _PanduanState extends State<Panduan> {
  bool showDescription = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        vertical: 16,
      ),
      padding: EdgeInsets.only(left: 16, right: 16),
      decoration: BoxDecoration(
        color: Colors.white,
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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Panduan Pembayaran",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                ),
              ),
              IconButton(
                icon: Icon(
                  showDescription
                      ? Icons.keyboard_arrow_up
                      : Icons.keyboard_arrow_down,
                ),
                onPressed: () {
                  setState(() {
                    showDescription = !showDescription;
                  });
                },
              ),
            ],
          ),
          if (showDescription)
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 8),
                Text(
                  "Deskripsi Pembayaran:",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed tincidunt velit id orci cursus, sit amet facilisis libero congue. Fusce dapibus felis vel vestibulum.",
                ),
              ],
            ),
        ],
      ),
    );
  }
}
