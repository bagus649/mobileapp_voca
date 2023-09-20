// ignore_for_file: use_key_in_widget_constructors
// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import 'package:mobile/componen/card_produk/product_list_screen.dart';
import 'package:mobile/componen/carousel/carousel_promo.dart';

class MobileGame extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: SingleChildScrollView(
      child: Column(
        children: [
          CarouselPromo(),
          // CustomContainer(),
          ProductListScreen(),
        ],
      ),
    ));
  }
}
