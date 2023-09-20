import 'package:flutter/material.dart';

import '../tournament/container_tournament_selesai.dart';

// ignore_for_file: use_key_in_widget_constructors
// ignore_for_file: prefer_const_constructors
// ignore: avoid_unnecessary_containers
class HalamanTournamenSelesai extends StatelessWidget {
  final int maxContainers;

  HalamanTournamenSelesai({required this.maxContainers});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> ads = [
      {
        'imageUrl': 'assets/images/m4.png',
        'title1': 'Persebaya Game Fest - Hedon ...',
        'title2': 'Winner • Team 1',
        'title3': 'Rp.25.000.000',
        'title4': '69/100 team',
      },
      {
        'imageUrl': 'assets/images/freefire_large.png',
        'title1': 'Persebaya Game Fest - Hedon ...',
        'title2': 'Winner • Team 1',
        'title3': 'Rp.15.000.000',
        'title4': '89/100 team',
      },
      {
        'imageUrl': 'assets/images/pubg_large.png',
        'title1': 'Persebaya Game Fest - Hedon ...',
        'title2': 'Winner • Team 1',
        'title3': 'Rp.25.000.000',
        'title4': '69/100 team',
      },
    ];

    return Column(
      children: ads
          .take(maxContainers)
          .map((ad) => TournamenSelesai(
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
