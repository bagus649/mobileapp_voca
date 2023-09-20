import 'package:flutter/material.dart';
import '../../transaksi/custom_container_menunggu_pembayaraan.dart';

// ignore_for_file: use_key_in_widget_constructors
// ignore_for_file: prefer_const_constructors
class DalamProsesTransaksi extends StatelessWidget {
  final List<Map<String, dynamic>> transaksiData = [
    {
      'tanggal': 'Selasa, 19 Agustus 2023 / 15:01',
      'harga': 'Rp.9.500',
      'gambar1': 'assets/images/mobilelegend.png',
      'gambar2': 'assets/images/diamond.png',
      'svg1': 'assets/icons/menunggu_pembayaraan.svg',
      'judul': 'Mobile Legend',
      'diamonds': '44 Diamonds (40 + 4 Bonus)',
      'buttonLabel': 'Menunggu Pembayaran',
      'buttonColor': Color(0xFFFF9800),
    },
    {
      'tanggal': 'Selasa, 19 Agustus 2023 / 15:01',
      'harga': 'Rp.9.500',
      'gambar1': 'assets/images/mobilelegend.png',
      'gambar2': 'assets/images/diamond.png',
      'svg1': 'assets/icons/menunggu_pembayaraan.svg',
      'judul': 'Mobile Legend',
      'diamonds': '44 Diamonds (40 + 4 Bonus)',
      'buttonLabel': 'Menunggu Pembayaran',
      'buttonColor': Color(0xFFFF9800),
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      child: SingleChildScrollView(
        child: Column(
          children: [
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: transaksiData.length,
              itemBuilder: (context, index) {
                final transaksi = transaksiData[index];
                return MenugguPembayaraan(
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
