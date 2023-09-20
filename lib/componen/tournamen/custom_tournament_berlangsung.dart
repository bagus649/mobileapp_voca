import 'package:flutter/material.dart';
import 'package:mobile/componen/tournament/container_tournament_berlangsung.dart';

// ignore_for_file: use_key_in_widget_constructors
// ignore_for_file: prefer_const_constructors
// ignore: avoid_unnecessary_containers
class HalamanTournamenBerlangsung extends StatelessWidget {
  final int maxContainers;

  HalamanTournamenBerlangsung({required this.maxContainers});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> ads = [
      {
        'imageUrl': 'assets/images/m4.png',
        'title1': '28 Januari 2023 - 29 Januari 2023',
        'title2': 'Sabtu, 07:00 - Minggu, 07:00 ',
        'title3': 'After Party MLBB Tournament by VocaGame',
        'title4': 'Online • Single Bracket',
      },
      {
        'imageUrl': 'assets/images/pubg_large.png',
        'title1': '28 Januari 2023 - 29 Januari 2023',
        'title2': 'Sabtu, 07:00 - Minggu, 07:00 ',
        'title3': 'After Party MLBB Tournament by VocaGame',
        'title4': 'Online • Single Bracket',
      },
      {
        'imageUrl': 'assets/images/freefire_large.png',
        'title1': '28 Januari 2023 - 29 Januari 2023',
        'title2': 'Sabtu, 07:00 - Minggu, 07:00 ',
        'title3': 'After Party MLBB Tournament by VocaGame',
        'title4': 'Online • Single Bracket',
      },
    ];

    return Column(
      children: ads
          .take(maxContainers)
          .map((ad) => TournamenBerlangsung(
                imageUrl: ad['imageUrl']!,
                title1: ad['title1']!,
                title2: ad['title2']!,
                title3: ad['title3']!,
                title4: ad['title4']!,
              ))
          .toList(),
    );
  }
}
