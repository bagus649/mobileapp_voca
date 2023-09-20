// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../componen/carousel/carousel_promo.dart';
import '../componen/invoice/panduan.dart';
import '../componen/invoice/status_order.dart';
import '../componen/invoice/track_order.dart';
import 'Navigation/Bottom_Navigation.dart';

// ignore_for_file: use_key_in_widget_constructors
// ignore_for_file: prefer_const_constructors
// ignore: avoid_unnecessary_containers
class QrisInvoicePage extends StatelessWidget {
  final List<OrderStepItem> OrderStatus = [
    OrderStepItem(
      svgAsset: 'assets/images/pesan.svg',
    ),
    OrderStepItem(svgAsset: 'assets/images/bayar.svg'),
    OrderStepItem(svgAsset: 'assets/images/kirim.svg'),
    OrderStepItem(svgAsset: 'assets/images/clear.svg'),
  ];
  DateTime _endTime = DateTime.now().add(Duration(hours: 24));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff17C82A),
        elevation: 0,
        title: Center(
            child: Container(
          padding: EdgeInsets.only(right: 40),
          child: Text(
            'Invoice Pembayaraan',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        )),
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.only(top: 16, left: 16, right: 16),
        height: 220,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Color(0xff9396AE).withOpacity(0.28),
              blurRadius: 10,
              spreadRadius: 0.01,
            ),
          ],
        ),
        child: SingleChildScrollView(
          physics: NeverScrollableScrollPhysics(),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(
              "Detail Pembelian",
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Color(0xff17C82A)),
            ),
            SizedBox(height: 12),
            Container(
              child: Row(
                children: [
                  Text(
                    "Tanggal Transaksi",
                    style: TextStyle(fontSize: 12, color: Color(0xff7C7D82)),
                  ),
                  Spacer(),
                  Text(
                    "4 Februari 2023 / 15:02",
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                ],
              ),
            ),
            SizedBox(height: 8),
            Container(
              child: Row(
                children: [
                  Text(
                    "Invoice",
                    style: TextStyle(fontSize: 12, color: Color(0xff7C7D82)),
                  ),
                  Spacer(),
                  Container(
                      // padding: EdgeInsets.only(right: 0),
                      child: Row(
                    children: [
                      Text(
                        "DEPO-16749793207770",
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                      Icon(
                        Icons.copy,
                        size: 16,
                      )
                    ],
                  )),
                ],
              ),
            ),
            SizedBox(height: 8),
            Container(
              padding: EdgeInsets.only(top: 8),
              decoration: const BoxDecoration(
                border: Border(
                  top: BorderSide(
                    color: Colors.black12,
                    width: 1.0,
                  ),
                ),
              ),
              child: Row(
                children: [
                  Text(
                    "Total Depo",
                    style: TextStyle(fontSize: 12, color: Color(0xff7C7D82)),
                  ),
                  Spacer(),
                  Container(
                    // padding: EdgeInsets.only(right: 0),

                    child: Text(
                      "Rp. 52.000,-",
                      style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 8),
            TextButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => TrackOrder()));
              },
              child: Container(
                width: double.infinity,
                alignment: Alignment.center,
                padding: EdgeInsets.symmetric(vertical: 16, horizontal: 89),
                child: Text(
                  'Track Order',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
                decoration: BoxDecoration(
                  color: Color(0xff17C82A),
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => BottomNavigasion()));
              },
              child: Container(
                alignment: Alignment.center,
                child: Text(
                  'Kembali Ke Beranda',
                  style: TextStyle(
                    color: Color(0xff8F92A1),
                  ),
                ),
              ),
            )
          ]),
        ),
      ),
      body: SingleChildScrollView(
        // padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.only(
                top: 8,
                bottom: 12,
              ),
              width: double.infinity,
              color: Colors.white,
              child: Column(
                children: [
                  Container(
                    // height: 200,
                    child: HorizontalOrderTracking(orderStatus: OrderStatus),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Text(
                    "Pesanan Berhasil Dibuat",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff17C82A)),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Text(
                    "Mohon selesaikan pembayaraan anda sebelum pesanan anda di batalkan",
                    style: TextStyle(fontSize: 12, color: Color(0xff8B8C8C)),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                ],
              ),
            ),
            Container(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Color(0xff9396AE).withOpacity(0.28),
                      blurRadius: 10,
                      spreadRadius: 0.01,
                    ),
                  ],
                ),
                padding: EdgeInsets.all(12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Selesaikan Pembayaraan Dalam :',
                      style: TextStyle(
                        fontSize: 12,
                        // fontWeight: FontWeight.bold,
                        // color: Colors.black,
                      ),
                    ),
                    SizedBox(width: 4),
                    Container(
                      child: CountdownWidget(
                        endTime: _endTime,
                        textColor: Color(0xffFBBF24),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 12, right: 12),
              child: Column(
                children: [
                  SizedBox(
                    height: 8,
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Pembayaran Via QRIS',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff17C82A),
                      ),
                    ),
                  ),
                  Container(
                      alignment: Alignment.center,
                      child: Image.asset('assets/images/qris.png')),
                  Container(
                      alignment: Alignment.center,
                      child: Image.asset(
                        'assets/images/qr_qris.png',
                        height: 200,
                        width: 200,
                      )),
                  SizedBox(
                    height: 8,
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 12, horizontal: 40),
                      child: Text(
                        'Donwload QR Code',
                        style: TextStyle(color: Color(0xff17C82A)),
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          width: 2,
                          color: Color(0xff17C82A),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 4),
              padding: EdgeInsets.all(4),
              decoration: BoxDecoration(
                color: Color(0xFFFFFBEB),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(16),
                  bottomRight: Radius.circular(16),
                ),
              ),
              child: Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 16),
                    child: SvgPicture.asset(
                      'assets/icons/warning.svg',
                      width: 16,
                      height: 16,
                    ),
                  ),
                  SizedBox(width: 16),
                  Expanded(
                    child: Text(
                      'Segera selesaikan pembayaran untuk menghindari pembatalan otomatis',
                      style: TextStyle(
                        fontSize: 12,
                        color: Color(0xFFB45309),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Panduan(),
          ],
        ),
      ),
    );
  }
}
