// ignore_for_file: use_key_in_widget_constructors
// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';

import '../../../componen/lain_lain/filter.dart';
import '../../filter/halaman_filter.dart';
import '../../transaksi/custom_container_transaksi_model.dart';

class RiwayatTransaksi extends StatelessWidget {
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
    return Container(
      color: Colors.transparent,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(left: 16, top: 16),
              alignment: Alignment.centerLeft,
              child: FilterButton(
                text: 'Filter',
                iconPath: 'assets/icons/filter.png',
                onPressed: () {
                  showModalBottomSheet(
                    context: context,
                    backgroundColor: Colors.transparent,
                    isScrollControlled: true,
                    builder: (BuildContext context) {
                      return BottomSheetFilter();
                    },
                  );
                },
              ),
            ),
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
