// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:mobile/componen/card_produk/custom_container.dart';
import 'package:mobile/componen/card_produk/title_card_produk.dart';

import '../carousel/carousel_promo.dart';

class PcGame extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
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
              'Semua Game',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          CustomContainer()
        ],
      ),
    ));
  }
}
