// ignore_for_file: unused_field

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mobile/componen/depposit/item_deposit.dart';
import 'package:mobile/componen/depposit/riwayat_deposit.dart';

import 'package:get/get.dart';

// ignore_for_file: use_key_in_widget_constructors
// ignore_for_file: prefer_const_constructors
// ignore: avoid_unnecessary_containers
class CustomCardDeposit extends StatefulWidget {
  final Function(bool) onTextFieldChanged;
  final DepositController depositController = Get.put(DepositController());

  CustomCardDeposit({required this.onTextFieldChanged});

  @override
  _CustomCardDepositState createState() => _CustomCardDepositState();
}

class _CustomCardDepositState extends State<CustomCardDeposit> {
  bool _showDepositContainer = true;
  bool _showRiwayatContainer = false;
  TextEditingController _depositController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: NeverScrollableScrollPhysics(),
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.all(16),
            padding: EdgeInsets.only(),
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.white,
                  blurRadius: 4.0,
                  // spreadRadius: 25,
                  offset: Offset(
                    -1,
                    -1,
                  ),
                )
              ],
              borderRadius: BorderRadius.circular(16),
              gradient: RadialGradient(
                colors: [
                  Color.fromRGBO(23, 200, 42, 1.00),
                  Color.fromRGBO(0, 255, 27, 1.00),
                ],
                center: Alignment.centerRight,
                radius: 2.0,
              ),
            ),
            height: 180,
            child: Stack(
              children: [
                Positioned(
                  left: 0,
                  right: 0,
                  bottom: 0,
                  top: 0,
                  child: Container(
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Color.fromRGBO(255, 255, 255, 0.25),
                          blurRadius: 4.0,
                          // spreadRadius: 25,
                          offset: Offset(
                            1,
                            1,
                          ),
                        )
                      ],
                      borderRadius: BorderRadius.circular(16),
                      gradient: RadialGradient(
                        colors: [
                          Color.fromRGBO(5, 16, 5, 0.480),
                          Color.fromRGBO(5, 255, 0, 1.00),
                        ],
                        center: Alignment.centerLeft,
                        radius: 2.4,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  right: 12,
                  top: 12,
                  child: SvgPicture.asset(
                    'assets/icons/vocacredit.svg',
                    width: 40,
                    height: 40,
                  ),
                ),
                Positioned(
                  top: 0,
                  right: 0,
                  child: SvgPicture.asset(
                    'assets/images/Intersect.svg',
                    width: 100,
                    height: 92,
                    fit: BoxFit.fill,
                  ),
                ),
                Positioned(
                  top: 12,
                  left: 0,
                  right: 0,
                  bottom: 0,
                  child: SvgPicture.asset(
                    'assets/images/gelombang2.svg',
                    fit: BoxFit.fill,
                  ),
                ),
                Positioned(
                  child: Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'Voca Credit',
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                        SizedBox(height: 8),
                        Text(
                          'Rp. 1.000.000',
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                        SizedBox(height: 24),
                        Container(
                          child: Row(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    _showDepositContainer = true;
                                    _showRiwayatContainer = false;
                                  });
                                  widget.onTextFieldChanged(false);
                                },
                                child: Container(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 16, vertical: 8),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                      color: _showDepositContainer
                                          ? Color(0xff17C82A)
                                          : Colors.white,
                                    ),
                                    child: Row(
                                      children: [
                                        Text(
                                          'Deposit',
                                          style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black),
                                        ),
                                        SizedBox(
                                          width: 20,
                                        ),
                                        Container(
                                            height: 24,
                                            child: Image.asset(
                                                fit: BoxFit.contain,
                                                'assets/icons/deposit2.png'))
                                      ],
                                    )),
                              ),
                              Spacer(),
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    _showDepositContainer = false;
                                    _showRiwayatContainer = true;
                                    _depositController.clear();
                                  });
                                  widget.depositController.setDepositText('');
                                  widget.onTextFieldChanged(false);
                                },
                                child: Container(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 16, vertical: 8),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                      color: _showRiwayatContainer
                                          ? Color(0xff17C82A)
                                          : Colors.white,
                                    ),
                                    child: Row(
                                      children: [
                                        Text(
                                          'Riwayat Deposit',
                                          style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black),
                                        ),
                                        SizedBox(
                                          width: 8,
                                        ),
                                        Container(
                                            height: 24,
                                            child: Image.asset(
                                                'assets/icons/riwayat.png'))
                                      ],
                                    )),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          if (_showDepositContainer)
            ItemDeposit(
              onTextFieldChanged: widget.onTextFieldChanged,
            ),
          if (!_showDepositContainer) RiwayatDeposit(),
        ],
      ),
    );
  }
}
