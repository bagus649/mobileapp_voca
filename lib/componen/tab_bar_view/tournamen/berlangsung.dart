import 'package:flutter/material.dart';

import '../../../componen/tournamen/custom_tournament_berlangsung.dart';
// ignore_for_file: use_key_in_widget_constructors
// ignore_for_file: prefer_const_constructors

import '../../tournament/container_buat_tournamen.dart';

class TournamenBerlangsung extends StatelessWidget {
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

              // LihatLainya(
              //     title1: 'Tournament Berlangsung', ),
              HalamanTournamenBerlangsung(maxContainers: 10),
            ],
          ),
        ));
  }
}
