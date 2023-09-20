import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../appbar_navbar/custom_appbar_navigasi.dart';
import 'card_metode_pembayaraan.dart';

class HalamanPembayaraan extends StatefulWidget {
  @override
  _HalamanPembayaraanState createState() => _HalamanPembayaraanState();
}

class _HalamanPembayaraanState extends State<HalamanPembayaraan> {
  String selectedPaymentMethod = 'Voca Credit';
  int _selectedIndex = -1;
  bool showBottomNavbar = false;
  String selectedData = '';
  final PaymentMethodController paymentMethodController =
      Get.find<PaymentMethodController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarCustom(title: 'Pilih Metode Pembayaraan'),
      bottomNavigationBar: showBottomNavbar
          ? GestureDetector(
              onTap: () {
                Navigator.pop(context);
                paymentMethodController.selectedMethodName.value;
                paymentMethodController.selectedMethodName(
                    '${paymentMethodController.selectedMethodName}');
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //     builder: (context) => BottomSheetPembelian(
                //       selectedData: selectedData,
                //     ),
                //   ),
                // );
                // Get.back(
                //
                //
                //   result: paymentMethodController.selectedMethodName.value);
              },
              child: Container(
                margin: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Color(0xff17C82A),
                ),
                height: 52,
                child: Center(
                  child: Text(
                    'Konfirmasi Metode Pembayaraan',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            )
          : null,
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              CardPembayarann(
                amount: '50.000',
                selectedIndex: _selectedIndex,
                onMethodSelected: (method) {
                  setState(() {
                    selectedPaymentMethod = method;
                    _selectedIndex = 0;
                    showBottomNavbar = true;
                    selectedData = method;
                  });
                },
                onTextFieldChanged: (show) {
                  setState(() {
                    showBottomNavbar = show;
                  });
                },
                selectedMethod: selectedPaymentMethod,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
