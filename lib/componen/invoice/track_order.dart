import 'package:flutter/material.dart';
import 'package:mobile/componen/invoice/status_order.dart';

import '../../halaman/Navigation/Bottom_Navigation.dart';
import '../../halaman/halaman_bukti_pembayaraan.dart';
import 'order_step.dart';

// ignore_for_file: use_key_in_widget_constructors
// ignore_for_file: prefer_const_constructors
// ignore: avoid_unnecessary_containers
class TrackOrder extends StatelessWidget {
  final List<OrderStep> orderSteps = [
    OrderStep(
      title: '12/31/2022, 4:25:08 PM',
      description: 'Pesanan Anda telah diterima oleh sistem.',
      isCompleted: true,
    ),
    OrderStep(
      title: '12/31/2022, 4:26:08 PM',
      description: 'Pesanan Dibayar',
      isCompleted: true,
    ),
    OrderStep(
      title: '12/31/2022, 4:26:09 PM',
      description: 'Pesanan Dikirim',
      isCompleted: true,
    ),
    OrderStep(
      title: '12/31/2022, 4:27:08 PM',
      description: 'Pesanan Selesai',
      isCompleted: true,
    ),
  ];

  final List<OrderStepItem> OrderStatus = [
    OrderStepItem(
      svgAsset: 'assets/images/pesan.svg',
    ),
    OrderStepItem(svgAsset: 'assets/images/bayar.svg'),
    OrderStepItem(svgAsset: 'assets/images/kirim.svg'),
    OrderStepItem(svgAsset: 'assets/images/clear.svg'),
  ];

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
            'Track Order',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        )),
      ),
      body: SingleChildScrollView(
        // padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
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
              padding: EdgeInsets.only(
                top: 12,
                bottom: 12,
              ),
              width: double.infinity,
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
                    "Pesanan Sukses",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff17C82A)),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                            padding: EdgeInsets.symmetric(
                                vertical: 8, horizontal: 24),
                            child: Column(
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      // ignore: sort_child_properties_last
                                      child: Image.asset(
                                        'assets/images/mobilelegend.png',
                                        height: 72,
                                        width: 72,
                                        fit: BoxFit.cover,
                                      ),
                                      margin: EdgeInsets.only(right: 16),
                                    ),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Mobile Legend',
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16,
                                            ),
                                          ),
                                          SizedBox(height: 4),
                                          Row(
                                            children: [
                                              Image.asset(
                                                  'assets/images/diamond.png'),
                                              SizedBox(width: 8),
                                              Flexible(
                                                child: Text(
                                                  '44 Diamonds (40 + 4 Bonus)',
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 12,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(height: 4),
                                          Text(
                                            'Rp.12.600,-',
                                            style: TextStyle(
                                              fontSize: 12,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            )),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 8,
            ),
            Container(
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
              padding: EdgeInsets.only(left: 12, right: 12),
              child: Column(
                children: [
                  SizedBox(
                    height: 8,
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Detail Pembayaraan',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Container(
                    child: Row(
                      children: [
                        Text(
                          "Invoice",
                          style:
                              TextStyle(fontSize: 12, color: Color(0xff7C7D82)),
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
                  SizedBox(
                    height: 8,
                  ),
                  Container(
                    child: Row(
                      children: [
                        Text(
                          "Tanggal Transaksi",
                          style:
                              TextStyle(fontSize: 12, color: Color(0xff7C7D82)),
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
                  SizedBox(
                    height: 8,
                  ),
                  Container(
                    child: Row(
                      children: [
                        Text(
                          "Barang",
                          style:
                              TextStyle(fontSize: 12, color: Color(0xff7C7D82)),
                        ),
                        Spacer(),
                        Text(
                          "44 Diamonds (40 + 4 Bonus)",
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Container(
                    child: Row(
                      children: [
                        Text(
                          "Metode ",
                          style:
                              TextStyle(fontSize: 12, color: Color(0xff7C7D82)),
                        ),
                        Spacer(),
                        Text(
                          "Qris",
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Container(
                    child: Row(
                      children: [
                        Text(
                          "Pembayaraan",
                          style:
                              TextStyle(fontSize: 12, color: Color(0xff7C7D82)),
                        ),
                        Spacer(),
                        Text(
                          "Rp.12.600,-",
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Username",
                          style:
                              TextStyle(fontSize: 12, color: Color(0xff7C7D82)),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Text(
                          "z911dn",
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Container(
                    child: Row(
                      children: [
                        Container(
                          alignment: Alignment.centerLeft,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "User Id",
                                style: TextStyle(
                                    fontSize: 12, color: Color(0xff7C7D82)),
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              Text(
                                "112428663",
                                style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 100,
                        ),
                        Container(
                          alignment: Alignment.centerLeft,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Zone ID",
                                style: TextStyle(
                                    fontSize: 12, color: Color(0xff7C7D82)),
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              Text(
                                "2572",
                                style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Nomor Handphone",
                          style:
                              TextStyle(fontSize: 12, color: Color(0xff7C7D82)),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Text(
                          "085156162840",
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 8,
            ),
            Container(
              padding: EdgeInsets.all(16),
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
              height: 320,
              child: OrderTracking(orderSteps: orderSteps),
            ),
            TextButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => BuktiPembayaraan()));
              },
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(vertical: 16, horizontal: 89),
                alignment: Alignment.center,
                child: Text(
                  'Check Status Pembayaran',
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
                width: double.infinity,
                alignment: Alignment.center,
                child: Text(
                  'Kembali Ke Beranda',
                  style: TextStyle(
                    color: Color(0xff8F92A1),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 16,
            ),
          ],
        ),
      ),
    );
  }
}
