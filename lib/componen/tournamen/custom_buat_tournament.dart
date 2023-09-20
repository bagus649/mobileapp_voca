import 'package:flutter/material.dart';
// ignore_for_file: use_key_in_widget_constructors
// ignore_for_file: prefer_const_constructors
// ignore: avoid_unnecessary_containers

import '../tournament/container_buat_tournamen.dart';

class Custom_Buat_tournamen extends StatelessWidget {
  Custom_Buat_tournamen({required});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> ads = [
      {
        'imageUrl': 'assets/images/m4.png',
        'title1': 'Buat tournament kamu sendiri!',
        'title2': 'Solusi kompetisi online dari kami',
      },
    ];

    return Column(
      children: ads
          .map((ad) => BuatTournament(
                imageUrl: ad['imageUrl']!,
                title1: ad['title1']!,
                title2: ad['title2']!,
              ))
          .toList(),
    );
  }
}
