import 'package:flutter/material.dart';
// ignore_for_file: use_key_in_widget_constructors
// ignore_for_file: prefer_const_constructors
// ignore: avoid_unnecessary_containers
import 'package:get/get.dart';
import 'package:mobile/componen/depposit/jumlah_deposit.dart';

class DepositController extends GetxController {
  final depositText = ''.obs;

  void setDepositText(String text) {
    depositText.value = text;
  }
}

typedef void OnTextFieldChangedCallback(bool showBottomNavbar);

class ItemDeposit extends StatefulWidget {
  final OnTextFieldChangedCallback onTextFieldChanged;

  ItemDeposit({required this.onTextFieldChanged});

  @override
  _ItemDepositState createState() => _ItemDepositState();
}

class _ItemDepositState extends State<ItemDeposit> {
  TextEditingController _depositController = TextEditingController();
  bool showBottomNavbar = false;

  List<Map<String, dynamic>> harga_deposit = [
    {
      'jumlah_deposit': '20.000',
    },
    {
      'jumlah_deposit': '40.000',
    },
    {
      'jumlah_deposit': '80.000',
    },
    {
      'jumlah_deposit': '100.000',
    },
    {
      'jumlah_deposit': '120.000',
    },
    {
      'jumlah_deposit': '140.000',
    },
    {
      'jumlah_deposit': '160.000',
    },
    {
      'jumlah_deposit': '180.000',
    },
  ];

  @override
  void initState() {
    super.initState();
    _depositController.text = '';
  }

  final DepositController depositController = Get.put(DepositController());

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 16, right: 16, top: 24, bottom: 24),
      margin: EdgeInsets.only(left: 16, right: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.25),
            blurRadius: 4.0,
            // spreadRadius: 25,
            offset: Offset(
              0,
              -1,
            ),
          )
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextField(
            controller: _depositController,
            onChanged: (value) {
              setState(() {
                _depositController.clear();
                showBottomNavbar = value.isNotEmpty;
              });
              depositController.setDepositText(value);
              widget.onTextFieldChanged(showBottomNavbar);
            },
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
            decoration: InputDecoration(
              hintText: ' Masukkan total deposit...',
              hintStyle: TextStyle(fontWeight: FontWeight.w400),
              labelText: 'Total Deposit',
              prefixText: 'RP. ',
              prefixStyle: TextStyle(
                fontWeight: FontWeight.bold,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),
          SizedBox(height: 12),
          Container(
            margin: EdgeInsets.only(left: 2),
            child: Text(
              'Atau Anda dapat memilih jumlah yang ingin Anda isi ulang di bawah ini',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
          ),
          SizedBox(
            height: 12,
          ),
          SingleChildScrollView(
            // physics: NeverScrollableScrollPhysics(),
            child: Container(
              height: 368,
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 1.8,
                ),
                itemCount: harga_deposit.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      final selectedAmount =
                          harga_deposit[index]['jumlah_deposit'];
                      depositController.setDepositText(selectedAmount);
                      _depositController.text = selectedAmount;
                      widget.onTextFieldChanged(true);
                    },
                    child: JumlahDeposit(
                      jumlah_deposit: harga_deposit[index]['jumlah_deposit'],
                    ),
                  );
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
