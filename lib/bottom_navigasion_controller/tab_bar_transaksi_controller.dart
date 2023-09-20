import 'package:flutter/material.dart';
import 'package:mobile/componen/tab_bar_view/dalam_proses_transaksi.dart';
import 'package:mobile/componen/tab_bar_view/riwayat_transaksi.dart';
// ignore_for_file: use_key_in_widget_constructors
// ignore_for_file: prefer_const_constructors
// ignore: avoid_unnecessary_containers

class TabBarTransaksi1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          toolbarHeight: 2,
          bottom: TabBar(
            padding: EdgeInsets.only(left: 16, right: 16),
            tabs: [
              Tab(
                child: Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Riwayat Transaksi',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
              Tab(
                child: Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Dalam Proses',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
            ],
            indicatorColor: Colors.green,
            labelColor: Colors.black,
          ),
        ),
        body: TabBarView(
          children: [
            RiwayatTransaksi(),
            DalamProsesTransaksi(),
          ],
        ),
      ),
    );
  }
}
