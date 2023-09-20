import 'package:flutter/material.dart';

import '../../../componen/tournamen/custom_tournament_berlangsung.dart';
import '../../../componen/tournamen/custom_tournament_mendatang.dart';
import '../../../componen/tournamen/custom_tournament_selesai.dart';

import '../../tournament/container_buat_tournamen.dart';
import '../../tournament/lihat_lainya_model.dart';

class SemuaTournamen extends StatelessWidget {
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
              LihatLainya(
                onTap: () {},
                title1: 'Tournament Mendatang',
                title2: 'Lihat Lainya',
                iconData: Icons.keyboard_arrow_right_sharp,
              ),
              HalamanTournamenMendatang(
                maxContainers: 0,
                isCarouselRunning: true,
              ),
              LihatLainya(
                onTap: () {},
                title1: 'Tournament Berlangsung',
                title2: 'Lihat Lainya',
                iconData: Icons.keyboard_arrow_right_sharp,
              ),
              HalamanTournamenBerlangsung(maxContainers: 2),
              LihatLainya(
                onTap: () {},
                title1: 'Tournament Selesai',
                title2: 'Lihat Lainya',
                iconData: Icons.keyboard_arrow_right_sharp,
              ),
              HalamanTournamenSelesai(maxContainers: 2),
            ],
          ),
        ));
  }
}
