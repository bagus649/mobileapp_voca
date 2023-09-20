// ignore_for_file: unused_field, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../appbar_navbar/custom_appbar_navigasi.dart';
import '../componen/depposit/card_deposit.dart';
import '../componen/depposit/item_deposit.dart';

class HalamanDeposit extends StatefulWidget {
  @override
  _HalamanDepositState createState() => _HalamanDepositState();
}

class _HalamanDepositState extends State<HalamanDeposit> {
  TextEditingController _depositController = TextEditingController();
  final DepositController depositController = Get.put(DepositController());

  bool showBottomNavbar = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarCustom(title: 'Voca Credit'),
      bottomNavigationBar: Obx(() {
        final showBottomNavbar = depositController.depositText.isNotEmpty;
        if (showBottomNavbar) {
          return Container(
            padding: EdgeInsets.symmetric(
              horizontal: 16,
            ),
            height: 64,
            child: Row(
              children: [
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Total Deposit',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(
                        height: 4,
                      ),
                      Text(
                        depositController.depositText.value,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
                Spacer(),
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Color(0xff17C82A),
                    ),
                    child: Text(
                      'Bayar',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                )
              ],
            ),
          );
        } else {
          return Container(
            height: 1,
          );
        }
      }),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  color: Color(0xff17C82A),
                  height: 200,
                  width: double.infinity,
                ),
                Positioned(
                  top: 16,
                  right: 0,
                  left: 0,
                  child: Container(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.orange,
                          radius: 32,
                          backgroundImage: AssetImage('assets/images/P.png'),
                        ),
                        SizedBox(width: 20),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Alexandre Saleh NurHasan',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 5),
                            Text(
                              '08223192838',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 90,
                      ),
                      CustomCardDeposit(
                        onTextFieldChanged: (show) {
                          setState(() {
                            showBottomNavbar = show;
                          });
                        },
                      ),
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
