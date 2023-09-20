// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:mobile/componen/berita_terkini/custom_container_berita.dart';

import 'package:mobile/componen/card_produk/product_list_screen.dart';

import 'package:mobile/componen/tournamen/custom_tournament_mendatang.dart';

import '../../../componen/carousel/carousel_promo.dart';
import '../../../halaman/semua_berita.dart';
import '../../tournament/lihat_lainya_model.dart';

class PcGame extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 100,
        child: SingleChildScrollView(
          child: Column(
            children: [
              CarouselPromo(),
              // CarouselPromo(),
              // SingleChildScrollView(
              //   child: Container(
              // height: double.maxFinite,
              // child:
              // Container(
              //   height: double.maxFinite,
              //   child: ProductListScreen(),
              // ),
              ProductListScreen(),
              //   ),
              // ),
              LihatLainya(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => BeritaPage()),
                  );
                },
                title1: 'Tournament Mendatang',
                title2: 'Lihat Lainya',
                iconData: Icons.arrow_forward_ios_rounded,
              ),
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
                title2: 'Lihat Lainya',
                iconData: Icons.arrow_forward_ios_rounded,
              ),
              CustomContainerBerita(
                maxContainers: 3,
                isCarouselRunning: true,
              ),
            ],
          ),
        ));
  }
}
