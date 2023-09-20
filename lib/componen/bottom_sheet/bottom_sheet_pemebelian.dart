// ignore_for_file: library_private_types_in_public_api, unused_local_variable

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:bottom_sheet/bottom_sheet.dart';
import 'package:get/get.dart';
import 'package:mobile/componen/card_produk/product_list_screen.dart';

import 'package:mobile/componen/detail_produk/custom_form_produk.dart';
import 'package:mobile/componen/pembayaraan/card_metode_pembayaraan.dart';
import 'package:mobile/componen/pembayaraan/halaman_metode_pembayaraan.dart';
import 'package:mobile/halaman/halaman_invoice_qris.dart';
import 'package:mobile/halaman/halaman_voucher.dart';

import 'package:shimmer/shimmer.dart';

import '../detail_produk/produk_detail_controller/product_detail_controller.dart';

// ignore_for_file: use_key_in_widget_constructors
// ignore_for_file: prefer_const_constructors
// ignore: avoid_unnecessary_containers
void showCustomBottomSheet(BuildContext context, String data) {
  showFlexibleBottomSheet(
    context: context,
    minHeight: 200,
    initHeight: 200,
    maxHeight: 800,
    builder: (BuildContext context, ScrollController scrollController,
        double height) {
      double contentHeight = height;
      if (contentHeight < 200) {
        contentHeight = 200;
      } else if (contentHeight > 800) {
        contentHeight = 800;
      }

      return Container(
        padding: EdgeInsets.all(16),
        height: contentHeight,
        child: BottomSheetPembelian(
          username: data,
        ),
      );
    },
  );
}

class BottomSheetPembelian extends StatefulWidget {
  final String username;

  const BottomSheetPembelian({super.key, required this.username});

  @override
  _BottomSheetPembelianState createState() => _BottomSheetPembelianState();
}

class _BottomSheetPembelianState extends State<BottomSheetPembelian> {
  final CustomFormController controller = Get.put(CustomFormController());

  final ProductDetailController productDetail =
      Get.put(ProductDetailController());
  // final ProductCardController productCard = Get.put(ProductCardController());
  // final PaymentMethodController paymentMethodController =
  // Get.find<PaymentMethodController>();

  final PaymentMethodController paymentMethodController = Get.find();
  final ProductCardController productCard = Get.put(ProductCardController());

  @override
  Widget build(BuildContext context) {
    final PaymentMethodController paymentMethodController =
        Get.find<PaymentMethodController>();

    String selectedMethodName =
        paymentMethodController.selectedMethodName.value;
    String selectedIconUrl = paymentMethodController.selectedIconUrl.value;
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

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(40.0), topLeft: Radius.circular(40.0)),
        color: Colors.white,
      ),
      padding: EdgeInsets.all(16),
      // ignore: avoid_unnecessary_containers
      child: Container(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 8,
              width: 80,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.black26,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'Detail Pesanan',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),

            SizedBox(
              height: 16,
            ),
            // ignore: avoid_unnecessary_containers
            Row(
              children: [
                Obx(
                  () => Text(
                    productCard.title.value,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 8,
            ),
            Container(
              child: Row(
                children: [
                  Obx(() => Container(
                      margin: EdgeInsets.only(
                        right: 8,
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),

                        child: CachedNetworkImage(
                          imageUrl: productCard.logoUrl.value,
                          placeholder: (context, url) {
                            return Shimmer.fromColors(
                              baseColor: Colors.grey[300]!,
                              highlightColor: Colors.grey[100]!,
                              child: Container(
                                height: 60,
                                width: 60,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                            );
                          },
                          errorWidget: (context, url, error) =>
                              Icon(Icons.error),
                          height: 60,
                          width: 60,
                          fit: BoxFit.contain,
                        ),

                        // ),
                      )

                      // margin: EdgeInsets.only(right: 16, top: 0),
                      )),

                  // ignore: avoid_unnecessary_containers
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // ignore: avoid_unnecessary_containers
                        Container(
                            child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              color: Colors.white.withOpacity(0.8),
                              child: CachedNetworkImage(
                                imageUrl:
                                    productDetail.iconUrl.value.toString(),
                                placeholder: (context, url) {
                                  return Shimmer.fromColors(
                                    baseColor: Colors.grey[300]!,
                                    highlightColor: Colors.grey[100]!,
                                    child: Container(
                                      height: 40,
                                      width: 40,
                                    ),
                                  );
                                },
                                errorWidget: (context, url, error) =>
                                    Icon(Icons.error),
                                height: 32,
                                width: 32,
                                fit: BoxFit.contain,
                              ),
                            ),
                            SizedBox(
                              width: 4,
                            ),
                            Obx(
                              () => Text(
                                productDetail.name.value,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12,
                                ),
                              ),
                            )
                          ],
                        )),
                        SizedBox(
                          height: 4,
                        ),
                        Text(
                          // 'Rp. ${productDetail.price.value.toString()}',
                          'Rp. ${formatPrice(productDetail.price.value)}',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                              color: Colors.black),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                ],
              ),
            ),

            SizedBox(
              height: 8,
            ),
            Row(
              children: [
                Text(
                  'Informasi Akun',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 4,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'UserName Akun :',
                  style: TextStyle(
                    color: Colors.black38,
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                Text(
                  widget.username,
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
            SizedBox(height: 2),
            Container(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(height: 8),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'User Id',
                        style: TextStyle(
                          color: Colors.black38,
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                        ),
                      ),
                      SizedBox(
                        height: 4,
                      ),
                      Obx(
                        () => Text(
                          '${controller.userId.value}',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 52,
                  ),
                  if (controller.zoneId.value.isNotEmpty)
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Zone Id',
                          style: TextStyle(
                            color: Colors.black38,
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                          ),
                        ),
                        SizedBox(
                          height: 4,
                        ),
                        Obx(
                          () => Text(
                            '${controller.zoneId.value}',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                            ),
                          ),
                        ),
                      ],
                    )
                  else if (controller.selectedDropdownItem.value?.label != null)
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Server',
                          style: TextStyle(
                            color: Colors.black38,
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                          ),
                        ),
                        Obx(
                          () => Text(
                            '${controller.selectedDropdownItem.value?.label}',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                            ),
                          ),
                        ),
                      ],
                    )
                  else
                    SizedBox(),
                ],
              ),
            ),
            SizedBox(
              height: 4,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'No Whatsapp',
                      style: TextStyle(
                        color: Colors.black38,
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                      ),
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    Obx(
                      () => Text(
                        '${controller.whatsappNumber.value}',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),

            SizedBox(
              height: 16,
            ),
            // ignore: avoid_unnecessary_containers
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // ignore: avoid_unnecessary_containers
                  Container(
                    child: Text(
                      'Metode Pembayaraan',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => HalamanPembayaraan()));
                    },
                    // ignore: avoid_unnecessary_containers
                    child: Container(
                      width: double.infinity,
                      color: Colors.white,
                      child: Row(
                        children: [
                          Obx(
                            () => Container(
                              margin: EdgeInsets.only(right: 8),
                              child: ClipRRect(
                                  borderRadius: BorderRadius.circular(8),
                                  child: Container(
                                    color: Colors.white70.withOpacity(0.8),
                                    // margin: EdgeInsets.only(right: 8),
                                    child: CachedNetworkImage(
                                      // imageUrl: selectedIconUrl,
                                      imageUrl: paymentMethodController
                                              .selectedMethodName
                                              .value
                                              .isNotEmpty
                                          ? paymentMethodController
                                              .selectedIconUrl.value
                                          : selectedIconUrl,
                                      placeholder: (context, url) {
                                        return Shimmer.fromColors(
                                          baseColor: Colors.grey[300]!,
                                          highlightColor: Colors.grey[100]!,
                                          child: Container(
                                            height: 40,
                                            width: 40,
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                            ),
                                          ),
                                        );
                                      },
                                      errorWidget: (context, url, error) {
                                        return Shimmer.fromColors(
                                          baseColor: Colors.grey[300]!,
                                          highlightColor: Colors.grey[100]!,
                                          child: Container(
                                            height: 40,
                                            width: 40,
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                            ),
                                          ),
                                        );
                                      },
                                      height: 40,
                                      width: 40,
                                      fit: BoxFit.contain,
                                    ),
                                  )),
                            ),
                          ),

                          SizedBox(
                            width: 12,
                          ),
                          // ignore: avoid_unnecessary_containers
                          Container(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              // ignore: prefer_const_literals_to_create_immutables
                              children: [
                                Obx(
                                  () => Text(
                                    paymentMethodController
                                            .selectedMethodName.value.isNotEmpty
                                        ? paymentMethodController
                                            .selectedMethodName.value
                                        : 'Bank BCA',
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                Text(
                                  'Rp. ${formatPrice(productDetail.price.value)}',
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black54),
                                ),
                              ],
                            ),
                          ),
                          Spacer(),
                          Icon(
                            Icons.radio_button_checked,
                            color: Color(0xff17C82A),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 16,
            ),
            // ignore: avoid_unnecessary_containers
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // ignore: avoid_unnecessary_containers
                  Container(
                    child: Text(
                      'Voucher',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Container(
                    padding: EdgeInsets.all(12),
                    decoration: BoxDecoration(
                        color: Color(0xffE7FEED),
                        //  border: Border.fromBorderSide),

                        borderRadius: BorderRadius.circular(12)),
                    child: Row(
                      children: [
                        Image.asset(
                          'assets/icons/voucher_beli.png',
                          width: 40,
                          height: 40,
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        Text(
                          'Pakai Voucher yang Tersedia',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Spacer(),
                        IconButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => HalamanVoucher()));
                            },
                            icon: Icon(
                              Icons.keyboard_arrow_right_outlined,
                              color: Colors.black26,
                            ))
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 16,
            ),
            // ignore: avoid_unnecessary_containers
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // ignore: avoid_unnecessary_containers
                  Container(
                    child: Text(
                      'Total Pembayaran',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ),
                  SizedBox(height: 8),
                  // ignore: avoid_unnecessary_containers
                  Container(
                      child: Column(
                    children: [
                      // ignore: avoid_unnecessary_containers
                      Container(
                        child: Row(
                          // ignore: prefer_const_literals_to_create_immutables
                          children: [
                            Text(
                              'Denom',
                              style: TextStyle(
                                fontSize: 16,
                              ),
                            ),
                            Spacer(),
                            Text(
                              '${productDetail.name.value.toString()}',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 4,
                      ),
                      // ignore: avoid_unnecessary_containers
                      Container(
                        child: Row(
                          // ignore: prefer_const_literals_to_create_immutables
                          children: [
                            Text(
                              'Total Pembayaraan',
                              style: TextStyle(
                                fontSize: 16,
                              ),
                            ),
                            Spacer(),
                            Text(
                              'Rp. ${formatPrice(productDetail.price.value)}',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  )),
                  SizedBox(
                    height: 16,
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => QrisInvoicePage()));
                    },
                    style: TextButton.styleFrom(
                      backgroundColor: Color.fromRGBO(23, 200, 42, 1),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40),
                      ),
                      minimumSize: Size(400, 50),
                    ),
                    child: Text(
                      'Bayar Sekarang',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
