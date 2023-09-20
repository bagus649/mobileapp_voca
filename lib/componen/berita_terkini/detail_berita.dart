import 'package:flutter/material.dart';
import 'package:mobile/appbar_navbar/custom_appbar_navigasi.dart';

class DetailPage extends StatelessWidget {
  final String title1;
  final String title2;
  final String imageUrl;

  // ignore: prefer_const_constructors_in_immutables, use_key_in_widget_constructors
  DetailPage(
      {required this.title1, required this.title2, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // ignore: prefer_const_constructors
      appBar: AppBarCustom(title: 'Berita Terkini'),
      body: Container(
        // ignore: prefer_const_constructors
        margin: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title1,
                // ignore: prefer_const_constructors
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            // ignore: prefer_const_constructors
            SizedBox(height: 4),
            Image.asset('assets/icons/logovoca.png', height: 32),
            // ignore: prefer_const_constructors
            SizedBox(height: 4),
            // ignore: prefer_const_constructors
            Text('18 Desember 2022  11:51 WIB'),
            // ignore: prefer_const_constructors
            SizedBox(height: 4),
            Image.asset(imageUrl),
            // ignore: prefer_const_constructors
            SizedBox(height: 12),
            // ignore: prefer_const_constructors
            Text(title2, style: TextStyle(fontSize: 16, color: Colors.grey)),
          ],
        ),
      ),
    );
  }
}
