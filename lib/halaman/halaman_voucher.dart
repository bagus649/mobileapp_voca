import 'package:flutter/material.dart';

import 'package:mobile/componen/voucher/voucher.dart';

import '../appbar_navbar/custom_appbar_navigasi.dart';
// ignore_for_file: use_key_in_widget_constructors
// ignore_for_file: prefer_const_constructors

class HalamanVoucher extends StatelessWidget {
  const HalamanVoucher({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarCustom(title: 'Voucher'),
      body: Container(
        // width: 2000,
        // color: Color(0xff17C82A),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              VoucherTopUp(
                title: 'Voucher Game Mobile',
                amount: '',
                paymentMethods: [
                  {
                    'buttonLabel1': 'Mobile Game',
                    'buttonLabel2': 'Voca Credit',
                    'discountText':
                        'Diskon Mobile Game dengan kode VOCALENTINE',
                    'tanggal': 'Ends Jul, 2023',
                  },
                  {
                    'buttonLabel1': 'Semua Game',
                    'buttonLabel2': 'Voca Credit',
                    'discountText':
                        'Diskon semua produk dengan kode VOCALENTINE',
                    'tanggal': 'Ends Sep, 2023',
                  },
                ],
              ),
              VoucherTopUp(
                title: 'Voucher Game Pc',
                amount: 'Rp. 50.000',
                paymentMethods: [
                  {
                    'buttonLabel1': 'Pc Game',
                    'buttonLabel2': 'Voca Credit',
                    'discountText':
                        'Diskon semua produk dengan kode VOCALENTINE',
                    'tanggal': 'Ends Feb, 2023',
                  },
                  {
                    'buttonLabel1': 'Semua Game',
                    'buttonLabel2': 'Voca Credit',
                    'discountText':
                        'Diskon semua produk dengan kode VOCALENTINE',
                    'tanggal': 'Ends Agust, 2023',
                  },
                  {
                    'buttonLabel1': 'Semua Game',
                    'buttonLabel2': 'Voca Credit',
                    'discountText': 'Diskon Game Pc dengan kode VOCALENTINE',
                    'tanggal': 'Ends Feb, 2023',
                  },
                  {
                    'buttonLabel1': 'Semua Game',
                    'buttonLabel2': 'Voca Credit',
                    'discountText':
                        'Diskon semua produk dengan kode VOCALENTINE',
                    'tanggal': 'Ends Jan, 2023',
                  },
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
