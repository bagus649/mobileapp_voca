// ignore_for_file: prefer_const_constructors, avoid_print, prefer_final_fields, library_private_types_in_public_api

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

import 'package:mobile/halaman/halaman_detail_produk_api.dart';

import 'package:mobile/services/service_provider.dart';
import 'package:shimmer/shimmer.dart';

import '../../models/json_flash_sale.dart';

class Promo extends StatefulWidget {
  const Promo({Key? key}) : super(key: key);

  @override
  _PromoState createState() => _PromoState();
}

class _PromoState extends State<Promo> {
  List<FlashSales> productList = [];
  int currentIndex = 0;
  PageController _pageController =
      PageController(initialPage: 1, viewportFraction: 0.42);

  @override
  void initState() {
    ambilData();
    super.initState();

    Timer.periodic(Duration(seconds: 3), (timer) {
      if (currentIndex < productList.length - 1) {
        _pageController.nextPage(
          duration: Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );
      } else {
        _pageController.animateToPage(
          0,
          duration: Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );
      }
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  Future<void> ambilData() async {
    try {
      var response = await ServiceProvider.getData('/product/discount');
      if (response != null) {
        setState(() {
          productList = (response.data as List)
              .map((x) => FlashSales.fromJson(x))
              .toList();
        });
      }
    } catch (error) {
      print(error);
    }
  }

  String formatPrice(int? price) {
    if (price == null) return "";
    final priceString = price.toString();
    final priceLength = priceString.length;

    if (priceLength <= 3) {
      return "Rp.$price";
    }

    final formattedPrice = StringBuffer("");
    int dotCount = 0;

    for (int i = priceLength - 1; i >= 0; i--) {
      formattedPrice.write(priceString[i]);
      dotCount++;

      if (dotCount == 3 && i > 0) {
        formattedPrice.write(".");
        dotCount = 0;
      }
    }

    return "Rp. " + formattedPrice.toString().split('').reversed.join();
  }

  @override
  Widget build(BuildContext context) {
    return productList.isEmpty
        ? Center(
            child: CircularProgressIndicator(),
          )
        : SizedBox(
            height: 240,
            child: PageView.builder(
              controller: _pageController,
              itemCount: productList.length,
              itemBuilder: (context, index) {
                final flashSales = productList[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ProductDetailApi(
                                  slug: flashSales.product?.slug ?? "",
                                )));
                  },
                  child: Container(
                    width: 200,
                    margin: EdgeInsets.symmetric(horizontal: 8),
                    child: Stack(
                      children: [
                        Container(
                          height: 220,
                          decoration: BoxDecoration(
                            color: Colors.black,
                            border: Border.all(
                              color: Color.fromRGBO(208, 208, 208, 100),
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Column(
                            children: [
                              ClipPath(
                                clipper: CustomWaveClipper(),
                                child: Container(
                                  height: 132,
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(8),
                                      topRight: Radius.circular(8),
                                    ),
                                  ),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(8.8),
                                    child: CachedNetworkImage(
                                      imageUrl:
                                          flashSales.product?.logoUrl ?? "",
                                      placeholder: (context, url) {
                                        return Shimmer.fromColors(
                                          baseColor: Colors.grey[300]!,
                                          highlightColor: Colors.grey[100]!,
                                          child: Container(
                                            height: 60,
                                            width: 60,
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                            ),
                                          ),
                                        );
                                      },
                                      errorWidget: (context, url, error) =>
                                          Icon(Icons.error),
                                      height: 60,
                                      width: 60,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.symmetric(
                                  horizontal: 12,
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      padding: EdgeInsets.only(top: 8),
                                      child: Text(
                                        flashSales.name ?? "",
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                        ),
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 4,
                                    ),
                                    Text(
                                      flashSales.product?.title ?? "",
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: Colors.white60,
                                      ),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    SizedBox(
                                      height: 4,
                                    ),
                                    Row(
                                      children: [
                                        Image.asset(
                                          'assets/images/vocagame_hijau.png',
                                          height: 20,
                                        ),
                                        Spacer(),
                                        Container(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.end,
                                            children: [
                                              Text(
                                                "${formatPrice(flashSales.priceDiscount)}",
                                                style: TextStyle(
                                                  fontSize: 11.2,
                                                  color: Colors.red,
                                                  decoration: TextDecoration
                                                      .lineThrough,
                                                  decorationColor: Colors.red,
                                                  decorationThickness: 2,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                              SizedBox(
                                                height: 4,
                                              ),
                                              Text(
                                                "${formatPrice(flashSales.price)}",
                                                style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 12,
                                                  color: Color(0xff17C82A),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          );
  }
}

class CustomWaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    final curveHeight = 12.0;

    path.lineTo(0, size.height);
    final firstControlPoint = Offset(size.width / 4, size.height);
    final firstEndPoint = Offset(size.width / 2, size.height - curveHeight);
    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
        firstEndPoint.dx, firstEndPoint.dy);

    final secondControlPoint =
        Offset(size.width * 3 / 4, size.height - 2 * curveHeight);
    final secondEndPoint = Offset(size.width, size.height - curveHeight);
    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
        secondEndPoint.dx, secondEndPoint.dy);

    path.lineTo(size.width, 0);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
