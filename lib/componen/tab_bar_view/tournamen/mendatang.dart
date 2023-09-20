import 'package:flutter/material.dart';
// ignore_for_file: use_key_in_widget_constructors
// ignore_for_file: prefer_const_constructors

import '../../../componen/tournamen/custom_tournament_mendatang.dart';

import '../../tournament/container_buat_tournamen.dart';

class TournamenMendatang extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.transparent,
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 24,
              ),
              BuatTournament(
                  imageUrl: 'assets/images/buat_tournament.png',
                  title1: 'Buat Tournament Kamu Sendiri!',
                  title2: 'Solusi kompetisi online dari kami'),

              HalamanTournamenMendatang(
                maxContainers: 0,
                isCarouselRunning: false,
              ),
              // LihatLainya(
              //     title1: 'Tournament Berlangsung', title2: 'Lihat Lainya'),
              // HalamanTournamenBerlangsung(maxContainers: 2),
              // LihatLainya(title1: 'Tournament Selesai', title2: 'Lihat Lainya'),
              // HalamanTournamenSelesai(maxContainers: 2),
            ],
          ),
        ));
  }
}
