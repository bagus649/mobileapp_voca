import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:mobile/componen/detail_produk/custom_kategori.dart';
import 'package:mobile/componen/detail_produk/custom_service.dart';

import 'package:get/get.dart';

import '../../appbar_navbar/custom_appbar_navigasi.dart';

final HargaDiskonController hargaDiskonController = Get.find();

String hargaDiskon = hargaDiskonController.selectedHargaDiskon.value;

class ProductDetailScreen extends StatefulWidget {
  final String imageUrl;
  final String title1;
  final String title2;
  final String imgLarge;

  ProductDetailScreen({
    required this.imageUrl,
    required this.title1,
    required this.title2,
    required this.imgLarge,
  });

  @override
  _ProductDetailScreenState createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  bool showBottomNavBar = true;

  @override
  void initState() {
    super.initState();
    showBottomNavBar = false;
  }

  final HargaDiskonController hargaDiskonController =
      Get.put(HargaDiskonController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarCustom(title: "Detail Produk"),
      bottomNavigationBar: Visibility(
        visible: showBottomNavBar,
        child: GestureDetector(
          onTap: () {},
          child: Container(
            height: 124,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(24.0),
                  topRight: Radius.circular(24.0),
                ),
                color: Color(0xff17C82A),
              ),
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: Column(
                children: [
                  Container(
                    alignment: Alignment.centerLeft,
                    width: 400,
                    child: Row(
                      children: [
                        Container(
                          margin: EdgeInsets.only(top: 8),
                          child: Row(
                            children: [
                              SvgPicture.asset('assets/icons/payment.svg'),
                              SizedBox(
                                width: 8,
                              ),
                              Text(
                                'Pembayaraan',
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                        Spacer(),
                        Text(
                          'Saldo',
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                        Icon(
                          Icons.chevron_right_rounded,
                          color: Colors.white,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    width: 400,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Total',
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 4),
                                height: 20,
                                width: 180,
                                child: Obx(() {
                                  final HargaDiskonController
                                      hargaDiskonController = Get.find();
                                  String hargaDiskon = hargaDiskonController
                                      .selectedHargaDiskon.value;

                                  return Text(
                                    'RP $hargaDiskon',
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  );
                                }),
                              )
                            ],
                          ),
                        ),
                        Spacer(),
                        ElevatedButton(
                          onPressed: () {
                            // showModalBottomSheet(
                            //   context: context,
                            //   backgroundColor: Colors.transparent,
                            //   isScrollControlled: true,
                            //   builder: (BuildContext context) {
                            //     return BottomSheetPembelian(
                            //         // selectedData: '',
                            //         );
                            //   },
                            // );
                          },
                          style: ElevatedButton.styleFrom(
                            fixedSize: Size(100, 8),
                            backgroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SvgPicture.asset(
                                'assets/icons/bag.svg',
                                color: Color.fromRGBO(23, 200, 42, 1),
                                width: 16.0,
                                height: 16.0,
                              ),
                              SizedBox(width: 8.0),
                              Text(
                                'Bayar',
                                style: TextStyle(
                                  color: Color(0xFF17C82A),
                                  fontSize: 16.0,
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 200,
              width: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(widget.imgLarge),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.title1,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  Text(
                    widget.title2,
                    style: TextStyle(fontSize: 16, color: Colors.grey),
                  ),
                ],
              ),
            ),
            SizedBox(height: 12),
            CustomService(),
            Padding(
              padding: const EdgeInsets.only(left: 16, top: 20),
              child: Text(
                'Informasi Pesanan',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            // CustomForm(  slug: widget.slug, ),
            Padding(
              padding: const EdgeInsets.only(left: 16, bottom: 16),
              child: Text(
                'Pilih Category',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            KategoriProduk(onItemSelected: (selected) {
              setState(() {
                showBottomNavBar = selected != null;
              });
            }),
          ],
        ),
      ),
    );
  }
}
