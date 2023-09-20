import 'package:flutter/material.dart';
import 'package:mobile/componen/lain_lain/filter.dart';

import 'package:mobile/componen/voucher/voucher.dart';

import '../transaksi/custom_container_transaksi_model.dart';

class RiwayatTransaksi extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.transparent,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.all(16),
                alignment: Alignment.centerLeft,
                child: FilterButton(
                  text: 'Filter',
                  iconPath: 'assets/icons/filter.png',
                  onPressed: () {},
                ),
              ),
              VoucherTopUp(
                title: '',
                amount: '',
                paymentMethods: [],
              ),
              CustomContainerTransaksi1(
                  tanggal: 'Selasa, 19 Agustus 2023 / 15:01',
                  harga: 'Rp.9.500',
                  gambar1: 'assets/images/mobilelegend.png',
                  gambar2: 'assets/images/diamond.png',
                  svg1: 'assets/icons/selesai.svg',
                  judul: 'Mobile Legend',
                  diamonds: '44 Diamonds (40 + 4 Bonus)',
                  buttonLabel: 'Selesai',
                  buttonColor: Color(0xff17C82A),
                  onPressed: () {}),
              CustomContainerTransaksi1(
                  tanggal: 'Selasa, 19 Agustus 2023 / 15:01',
                  harga: 'Rp.9.500',
                  gambar1: 'assets/images/mobilelegend.png',
                  gambar2: 'assets/images/diamond.png',
                  svg1: 'assets/icons/batal.svg',
                  judul: 'Mobile Legend',
                  diamonds: '44 Diamonds (40 + 4 Bonus)',
                  buttonLabel: 'Batal',
                  buttonColor: Color(0xffEF4444),
                  onPressed: () {}),
            ],
          ),
        ));
  }
}
