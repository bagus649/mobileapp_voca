import 'package:flutter/material.dart';
import 'package:mobile/componen/tournament/lihat_lainya_model.dart';
// ignore_for_file: use_key_in_widget_constructors
// ignore_for_file: prefer_const_constructors
// ignore: avoid_unnecessary_containers

class CustomLihatLainya extends StatelessWidget {
  CustomLihatLainya({required});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> ads = [
      {
        'title1': 'tournament',
        'title2': 'lihat ',
      },
    ];

    return Column(
      children: ads
          .map((ad) => LihatLainya(
                title1: ad['title1']!,
                title2: ad['title2']!,
                iconData: Icons.arrow_forward_ios_rounded,
                onTap: () {},
              ))
          .toList(),
    );
  }
}
