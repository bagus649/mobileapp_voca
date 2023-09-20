// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import 'package:mobile/componen/card_produk/custom_container.dart';
import 'package:mobile/componen/tournamen/custom_tournament_mendatang.dart';

import '../../halaman/semua_berita.dart';
import '../berita_terkini/custom_container_berita.dart';
import '../card_produk/title_card_produk.dart';
import '../carousel/carousel_promo.dart';

import '../tournament/lihat_lainya_model.dart';

class Semua extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 100,
        child: SingleChildScrollView(
          child: Column(
            children: [
              CarouselPromo(),
              // CustomContainer(),
              Custom_Container_Title(
                  iconImagePath: 'assets/icons/fire.png', title: 'Populer'),

              CustomContainer(),

              Custom_Container_Title(
                  iconImagePath: 'assets/icons/star.png', title: 'Baru Rilis'),
              CustomContainer(),
              Container(
                alignment: Alignment.topLeft,
                margin: EdgeInsets.only(left: 20, top: 16),
                child: Text(
                  'Mobile Game',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              CustomContainer(),
              Container(
                alignment: Alignment.topLeft,
                margin: EdgeInsets.only(left: 20, top: 16),
                child: Text(
                  'Pc Game',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              CustomContainer(),
              LihatLainya(
                  onTap: () {},
                  title1: 'Tournament Mendatang',
                  title2: 'Lihat Lainya',
                  iconData: Icons.keyboard_arrow_right_outlined),
              HalamanTournamenMendatang(
                maxContainers: 3,
                isCarouselRunning: true,
              ),
              SizedBox(
                height: 12,
              ),
              LihatLainya(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => BeritaPage()),
                    );
                  },
                  title1: 'Berita Terkini',
                  title2: ' Lainya',
                  iconData: Icons.keyboard_arrow_right_outlined),
              CustomContainerBerita(
                maxContainers: 3,
                isCarouselRunning: true,
              ),
            ],
          ),
        ));
  }
}
