import 'package:flutter/material.dart';

import '../transaksi/custom_container_menunggu_pembayaraan.dart';

class DalamProsesTransaksi extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.transparent,
        child: SingleChildScrollView(
          child: Column(
            children: [
              MenugguPembayaraan(
                  tanggal: 'Selasa, 19 Agustus 2023 / 15:01',
                  harga: 'Rp.9.500',
                  gambar1: 'assets/images/mobilelegend.png',
                  gambar2: 'assets/images/diamond.png',
                  svg1: 'assets/icons/menunggu_pembayaraan.svg',
                  judul: 'Mobile Legend',
                  diamonds: '44 Diamonds (40 + 4 Bonus)',
                  buttonLabel: 'Menunggu Pembayaran',
                  buttonColor: Color(0xFFFF9800),
                  onPressed: () {}),
              MenugguPembayaraan(
                  tanggal: 'Selasa, 19 Agustus 2023 / 15:01',
                  harga: 'Rp.9.500',
                  gambar1: 'assets/images/mobilelegend.png',
                  gambar2: 'assets/images/diamond.png',
                  svg1: 'assets/icons/menunggu_pembayaraan.svg',
                  judul: 'Mobile Legend',
                  diamonds: '44 Diamonds (40 + 4 Bonus)',
                  buttonLabel: 'Menunggu Pembayaran',
                  buttonColor: Color(0xFFFF9800),
                  onPressed: () {}),
            ],
          ),
        ));
  }
}
