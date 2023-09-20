import 'dart:convert';
import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import 'package:mobile/componen/bottom_sheet/bottom_sheet_pemebelian.dart';
import 'package:mobile/componen/detail_produk/category_produk_api.dart';
import 'package:mobile/componen/detail_produk/custom_form_produk.dart';
import 'package:mobile/componen/detail_produk/custom_service.dart';

import 'package:mobile/services/service_controller.dart';
import 'package:mobile/services/service_provider.dart';
import 'package:shimmer/shimmer.dart';

import '../componen/detail_produk/produk_detail_controller/product_detail_controller.dart';
import '../models/json_alert_code.dart';
import '../models/json_detail_products.dart';

class ProductDetailApi extends StatefulWidget {
  final String slug;
  final String? selectedPriceFormatted;

  ProductDetailApi({
    required this.slug,
    this.selectedPriceFormatted,
  });

  @override
  _ProductDetailApiState createState() => _ProductDetailApiState();
}

class _ProductDetailApiState extends State<ProductDetailApi> {
  DetailProducts? detailProducts;
  bool showBottomNavBar = true;
  final ProductDetailController productDetail =
      Get.put(ProductDetailController());
  final CustomFormController controller = Get.put(CustomFormController());
  Alertcode? alertcode;

  @override
  void initState() {
    super.initState();
    ambilData();
    showBottomNavBar = false;
  }

  Future<void> ambilData() async {
    try {
      var response = await ServiceProvider.getData('/product/${widget.slug}');
      if (response != null) {
        var jsonString = json.encode(response.data);
        DetailProducts data = detailProductsFromJson(jsonString);
        setState(() {
          detailProducts = data;
        });
      }
    } catch (error) {
      print('Error in HTTP request: $error');
    }
  }

  void _showInfoDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          contentPadding: EdgeInsets.all(0.2),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Align(
                alignment: Alignment.topRight,
                child: IconButton(
                  icon: Icon(Icons.close),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ),
              Container(
                padding:
                    EdgeInsets.only(top: 0, bottom: 44, left: 20, right: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Information',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18.0,
                      ),
                    ),
                    SizedBox(height: 12.0),
                    Text(
                      detailProducts?.description ?? 'No description available',
                      style: TextStyle(
                        fontSize: 16.0,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    String formatPrice(int? price) {
      if (price != null) {
        final priceString = price.toString();
        final parts = List<String>.generate(
          (priceString.length / 3).ceil(),
          (index) => priceString.substring(
            (priceString.length - (index + 1) * 3).clamp(0, priceString.length),
            (priceString.length - index * 3).clamp(0, priceString.length),
          ),
        );
        return parts.reversed.join('.');
      }
      return '';
    }

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
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
                              Text(
                                'Rp. ${formatPrice(productDetail.price.value)}',
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                        Spacer(),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            fixedSize: Size(100, 8),
                            backgroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                          ),
                          onPressed: () async {
                            final customFormController =
                                Get.find<CustomFormController>();
                            final whatsappNumber =
                                customFormController.whatsappNumber.value;

                            if (whatsappNumber.isNotEmpty &&
                                detailProducts != null) {
                              String? code = detailProducts!.code;
                              print("isLoading");
                              try {
                                String url = '/order/prepare/$code';

                                if (controller.userId.value.isNotEmpty) {
                                  url += '?userId=${controller.userId.value}';
                                }

                                if (controller.zoneId.value.isNotEmpty) {
                                  url +=
                                      '${url.contains('?') ? '&' : '?'}zoneId=${controller.zoneId.value}';
                                }

                                var response =
                                    await ServiceProvider.getData(url)
                                        .catchError(
                                            ServiceController().handleErrorya);
                                if (response != null) {
                                  var jsonString = json.encode(response.data);

                                  Alertcode data =
                                      alertcodeFromJson(jsonString);
                                  setState(() {
                                    print("Sukses");
                                    alertcode = data;
                                    if (data.data == null) {
                                      Get.showSnackbar(
                                        GetBar(
                                          message: "😢 Data Tidak ditemukan,",
                                          mainButton: GestureDetector(
                                            onTap: () {
                                              if (Get.isSnackbarOpen)
                                                Get.back();
                                            },
                                            child: Container(
                                              margin:
                                                  EdgeInsets.only(right: 10),
                                              child: Icon(
                                                Icons.close,
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                          isDismissible: true,
                                          snackStyle: SnackStyle.FLOATING,
                                          margin: EdgeInsets.symmetric(
                                              horizontal: 12, vertical: 12),
                                          borderRadius: 4,
                                          animationDuration:
                                              Duration(seconds: 1),
                                          duration: Duration(seconds: 1),
                                          backgroundColor: Colors.red,
                                          snackPosition: SnackPosition.TOP,
                                        ),
                                      );
                                    } else {
                                      showModalBottomSheet(
                                        context: context,
                                        backgroundColor: Colors.transparent,
                                        isScrollControlled: true,
                                        builder: (BuildContext context) {
                                          return BottomSheetPembelian(
                                            username: data.data ?? '',
                                          );
                                        },
                                      );
                                    }
                                  });
                                }
                              } catch (error) {
                                print('Error in HTTP request: $error');
                                // Menampilkan notifikasi jika terjadi kesalahan
                                Get.snackbar(
                                  "Error",
                                  "Terjadi kesalahan saat memuat data. Silakan coba lagi nanti.",
                                  snackPosition: SnackPosition.BOTTOM,
                                  backgroundColor: Colors.red,
                                  colorText: Colors.white,
                                );
                              }
                            } else {
                              Get.showSnackbar(
                                GetBar(
                                  message: "😢 User Tidak ditemukan,",
                                  mainButton: GestureDetector(
                                    onTap: () {
                                      if (Get.isSnackbarOpen) Get.back();
                                    },
                                    child: Container(
                                      margin: EdgeInsets.only(right: 10),
                                      child: Icon(
                                        Icons.close,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                  isDismissible: true,
                                  snackStyle: SnackStyle.FLOATING,
                                  margin: EdgeInsets.symmetric(
                                      horizontal: 12, vertical: 12),
                                  borderRadius: 4,
                                  animationDuration: Duration(seconds: 1),
                                  duration: Duration(seconds: 1),
                                  backgroundColor: Colors.red,
                                  snackPosition: SnackPosition.TOP,
                                ),
                              );
                            }
                          },
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
                        ),
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
            Stack(
              children: [
                Container(
                  height: 220,
                  child: PageView.builder(
                    itemCount: 1,
                    itemBuilder: (context, index) {
                      return Container(
                        height: 220,
                        child: Align(
                          alignment: Alignment.center,
                          child: OverflowBox(
                            maxWidth: double.infinity,
                            child: CachedNetworkImage(
                              imageUrl: detailProducts?.bannerUrl ?? '',
                              placeholder: (context, url) {
                                return Shimmer.fromColors(
                                  baseColor: Colors.grey[300]!,
                                  highlightColor: Colors.grey[100]!,
                                  child: Container(
                                    height: 220,
                                    width: 800,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                  ),
                                );
                              },
                              errorWidget: (context, url, error) {
                                return Shimmer.fromColors(
                                  baseColor: Colors.grey[300]!,
                                  highlightColor: Colors.grey[100]!,
                                  child: Container(
                                    height: 220,
                                    width: 800,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                  ),
                                );
                              },
                              fit: BoxFit.fill,
                              height: 220,
                              width: 800,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                Container(
                  height: 220,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.transparent,
                        Colors.white.withOpacity(0.001),
                        Colors.white,
                      ],
                      stops: [0.0, 0.4, 1.0],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        detailProducts?.title ?? '',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        width: 4,
                      ),
                      GestureDetector(
                        onTap: () {
                          _showInfoDialog(context);
                        },
                        child: SvgPicture.asset(
                          'assets/icons/Information_circle.svg',
                          color: Color(0xff17C82A),
                          width: 20,
                          height: 20,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 8),
                  Text(
                    detailProducts?.subTitle ?? '',
                    style: TextStyle(fontSize: 16, color: Colors.grey),
                  ),
                ],
              ),
            ),
            SizedBox(height: 12),
            CustomService(),
            SizedBox(height: 12),
            CustomForm(
              slug: widget.slug,
            ),
            CategoryProdukApi(
              onItemSelected: (selected) {
                setState(() {
                  showBottomNavBar = selected != null;
                });

                if (selected != null) {
                  // ignore: unused_local_variable
                  // final productDetail = Get.find<TotalPrice>();
                }
              },
              slug: widget.slug,
            ),
          ],
        ),
      ),
    );
  }
}
