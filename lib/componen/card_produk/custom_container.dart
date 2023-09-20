// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile/componen/beranda/cardproduk_item.dart';

// ignore_for_file: use_key_in_widget_constructors
// ignore_for_file: prefer_const_constructors
// ignore: avoid_unnecessary_containers

import '../detail_produk/detail_produk.dart';

class CustomContainer extends StatefulWidget {
  @override
  _CustomContainerlState createState() => _CustomContainerlState();
}

class _CustomContainerlState extends State<CustomContainer> {
  final List<Map<String, String>> products = [
    {
      'imageUrl': 'assets/images/pubg.png',
      'title1': 'Pubg Mobile',
      'title2': 'Tencent',
      'imgLarge': 'assets/images/pubg_large.png',
    },
    {
      'imageUrl': 'assets/images/mobilelegend.png',
      'title1': 'Mobile Legend',
      'title2': 'Moonton',
      'imgLarge': 'assets/images/mobilelegend_large.png',
    },
    {
      'imageUrl': 'assets/images/freefire.png',
      'title1': 'Freefire',
      'title2': 'Garena',
      'imgLarge': 'assets/images/freefire_large.png',
    },
    {
      'imageUrl': 'assets/images/mobilelegend.png',
      'title1': 'Mobile Legend',
      'title2': 'Moonton',
      'imgLarge': 'assets/images/mobilelegend_large.png',
    },
  ];

  @override
  Widget build(BuildContext context) {
    // ignore: sized_box_for_whitespace
    return Container(
      height: 318,
      child: GridView.builder(
        padding: EdgeInsets.all(16),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          childAspectRatio: 0.8,
        ),
        physics: NeverScrollableScrollPhysics(),
        itemCount: products.length,
        itemBuilder: (context, index) {
          return ProductCard(
            imageUrl: products[index]['imageUrl']!,
            title1: products[index]['title1']!,
            title2: products[index]['title2']!,
            onTap: () {
              Get.to(ProductDetailScreen(
                imageUrl: products[index]['imageUrl']!,
                imgLarge: products[index]['imgLarge']!,
                title1: products[index]['title1']!,
                title2: products[index]['title2']!,
              ));
            },
          );
        },
      ),
    );
  }
}
