// ignore_for_file: unused_field

import 'package:flutter/material.dart';

import 'riwayat_selesai.dart';
// ignore_for_file: use_key_in_widget_constructors
// ignore_for_file: prefer_const_constructors

class RiwayatDeposit extends StatefulWidget {
  @override
  _RiwayatDepositState createState() => _RiwayatDepositState();
}

class _RiwayatDepositState extends State<RiwayatDeposit> {
  List<Map<String, dynamic>> Berlangsung = [
    {
      'date': '29 Jan 2023 / 15:01',
      'imagePath': 'assets/icons/logovoca.png',
      'title': 'Deposit Voca Credit',
      'status': 'Menunggu Pembayaran',
      'amount': 'Rp 20.000,-',
      'colorstatus': 0xffFF8900,
    },
    {
      'date': '29 Jan 2023 / 15:01',
      'imagePath': 'assets/icons/logovoca.png',
      'title': 'Deposit Voca Credit',
      'status': 'Menunggu Pembayaran',
      'amount': 'Rp 20.000,-',
      'colorstatus': 0xffFF8900,
    },
    {
      'date': '29 Jan 2023 / 15:01',
      'imagePath': 'assets/icons/logovoca.png',
      'title': 'Deposit Voca Credit',
      'status': 'Menunggu Pembayaran',
      'amount': 'Rp 20.000,-',
      'colorstatus': 0xffFF8900,
    },
  ];

  List<Map<String, dynamic>> Selesai = [
    {
      'date': '29 Jan 2023 / 15:01',
      'imagePath': 'assets/icons/logovoca.png',
      'title': 'Deposit Voca Credit',
      'status': 'Selesai',
      'amount': 'Rp 20.000,-',
      'colorstatus': 0xff16C829,
    },
    {
      'date': '29 Jan 2023 / 15:01',
      'imagePath': 'assets/icons/logovoca.png',
      'title': 'Deposit Voca Credit',
      'status': 'Selesai',
      'amount': 'Rp 20.000,-',
      'colorstatus': 0xff16C829,
    },
    {
      'date': '29 Jan 2023 / 15:01',
      'imagePath': 'assets/icons/logovoca.png',
      'title': 'Deposit Voca Credit',
      'status': 'Selesai',
      'amount': 'Rp 20.000,-',
      'colorstatus': 0xff16C829,
    },
    {
      'date': '29 Jan 2023 / 15:01',
      'imagePath': 'assets/icons/logovoca.png',
      'title': 'Deposit Voca Credit',
      'status': 'Selesai',
      'amount': 'Rp 20.000,-',
      'colorstatus': 0xff16C829,
    },
    {
      'date': '29 Jan 2023 / 15:01',
      'imagePath': 'assets/icons/logovoca.png',
      'title': 'Deposit Voca Credit',
      'status': 'Selesai',
      'amount': 'Rp 20.000,-',
      'colorstatus': 0xff16C829,
    },
  ];

  bool _showDepositContainer = false;
  bool _showRiwayatSelesai = true;
  TextEditingController _depositController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.only(
          left: 16,
          right: 16,
          top: 24,
        ),
        margin: EdgeInsets.only(left: 16, right: 16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.25),
              blurRadius: 4.0,
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
            SwipeSwitch(
              onSwitch: (isSwitched) {
                setState(() {
                  if (isSwitched) {
                    _showDepositContainer = true;
                    _showRiwayatSelesai = false;
                  } else {
                    _showDepositContainer = false;
                    _showRiwayatSelesai = true;
                  }
                });
              },
            ),
            if (_showDepositContainer)
              Container(
                  height: 360,
                  child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 1, childAspectRatio: 1.92
                        // crossAxisSpacing: 16,
                        // mainAxisSpacing: 16,
                        ),
                    itemCount: Berlangsung.length,
                    itemBuilder: (context, index) {
                      return RiwayatContainer(
                        date: Berlangsung[index]['date'],
                        imagePath: Berlangsung[index]['imagePath'],
                        title: Berlangsung[index]['title'],
                        status: Berlangsung[index]['status'],
                        colorstatus: Berlangsung[index]['colorstatus'],
                        amount: Berlangsung[index]['amount'],
                      );
                    },
                  ))
            else if (_showRiwayatSelesai)
              Container(
                  height: 360,
                  child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 1,
                      childAspectRatio: 1.92,
                      crossAxisSpacing: 16,
                    ),
                    itemCount: Selesai.length,
                    itemBuilder: (context, index) {
                      return RiwayatContainer(
                        date: Selesai[index]['date'],
                        imagePath: Selesai[index]['imagePath'],
                        title: Selesai[index]['title'],
                        status: Selesai[index]['status'],
                        colorstatus: Selesai[index]['colorstatus'],
                        amount: Selesai[index]['amount'],
                      );
                    },
                  ))
          ],
        ),
      ),
    );
  }
}

class SwipeSwitch extends StatefulWidget {
  final ValueChanged<bool> onSwitch;

  SwipeSwitch({required this.onSwitch});

  @override
  _SwipeSwitchState createState() => _SwipeSwitchState();
}

class _SwipeSwitchState extends State<SwipeSwitch> {
  bool _isSwitched = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GestureDetector(
        onTap: () {
          setState(() {
            _isSwitched = !_isSwitched;
          });
          widget.onSwitch(_isSwitched);
        },
        child: Container(
          width: 320,
          height: 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            color: _isSwitched ? Color(0xffF6F7FA) : Color(0xffF6F7FA),
          ),
          child: Stack(
            alignment: Alignment.center,
            children: [
              Positioned(
                left: _isSwitched ? 5 : null,
                right: _isSwitched ? null : 5,
                child: Container(
                  margin: EdgeInsets.only(left: 32, right: 32),
                  child: Text(
                    _isSwitched ? 'Selesai' : 'Berlangsung',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              AnimatedAlign(
                duration: Duration(milliseconds: 300),
                alignment:
                    _isSwitched ? Alignment.centerRight : Alignment.centerLeft,
                child: Container(
                  margin: EdgeInsets.all(4),
                  width: 180,
                  height: 50,
                  padding: EdgeInsets.only(left: 40, right: 40),
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Color(0xff9396AE).withOpacity(0.28),
                        blurRadius: 10,
                        spreadRadius: 0.01,
                      ),
                    ],
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: Center(
                    child: Text(
                      _isSwitched ? 'Berlangsung' : 'Selesai',
                      style: TextStyle(
                        fontSize: 16,
                        color: _isSwitched ? Colors.green : Colors.green,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
