import 'package:flutter/material.dart';

import '../appbar_navbar/custom_appbar_navigasi.dart';
import '../componen/side_menu/lacak_pesanan.dart';
import '../componen/transaksi/custom_container_transaksi_model.dart';

class LacakPesanan extends StatefulWidget {
  @override
  _LacakPesananState createState() => _LacakPesananState();
}

class _LacakPesananState extends State<LacakPesanan> {
  final List<Map<String, dynamic>> transaksiData = [
    {
      'nohandphone': '0822',
      'tanggal': 'Selasa, 19 Agustus 2023 / 15:01',
      'harga': 'Rp.9.500',
      'gambar1': 'assets/images/mobilelegend.png',
      'gambar2': 'assets/images/diamond.png',
      'svg1': 'assets/icons/selesai.svg',
      'judul': 'Mobile Legend',
      'diamonds': '44 Diamonds (40 + 4 Bonus)',
      'buttonLabel': 'Selesai',
      'buttonColor': Color(0xff17C82A),
    },
    {
      'nohandphone': '0822',
      'tanggal': 'Selasa, 19 Agustus 2023 / 15:01',
      'harga': 'Rp.9.500',
      'gambar1': 'assets/images/mobilelegend.png',
      'gambar2': 'assets/images/diamond.png',
      'svg1': 'assets/icons/batal.svg',
      'judul': 'Mobile Legend',
      'diamonds': '44 Diamonds (40 + 4 Bonus)',
      'buttonLabel': 'Batal',
      'buttonColor': Color(0xffEF4444),
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarCustom(
        title: 'Lacak Pesanan',
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(children: [
              Container(
                  decoration: BoxDecoration(
                    color: Color(0xff17C82A),
                    borderRadius: BorderRadius.vertical(
                      bottom: Radius.circular(80),
                    ),
                  ),
                  height: 80,
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    children: [],
                  )),
              Positioned(
                  child: Container(
                margin: EdgeInsets.only(top: 28, left: 20, right: 20),
                padding: EdgeInsets.symmetric(vertical: 20, horizontal: 16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Text(
                      'Lacak Pesanan',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Text(
                      'masukan nomor telepon kamu untuk melacak pesananmu',
                      style: TextStyle(
                        fontSize: 12,
                      ),
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    FormLacakPesanan(),
                  ],
                ),
              )),
            ]),
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: transaksiData.length,
              itemBuilder: (context, index) {
                final transaksi = transaksiData[index];
                return CustomContainerTransaksi1(
                  tanggal: transaksi['tanggal'],
                  harga: transaksi['harga'],
                  gambar1: transaksi['gambar1'],
                  gambar2: transaksi['gambar2'],
                  svg1: transaksi['svg1'],
                  judul: transaksi['judul'],
                  diamonds: transaksi['diamonds'],
                  buttonLabel: transaksi['buttonLabel'],
                  buttonColor: transaksi['buttonColor'],
                  onPressed: () {},
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
