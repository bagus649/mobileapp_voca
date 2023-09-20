// ignore_for_file: use_key_in_widget_constructors
// ignore_for_file: prefer_const_constructors
// ignore: avoid_unnecessary_containers
import 'package:flutter/material.dart';
import 'package:mobile/componen/tab_bar_view/beranda/mobile_game.dart';
import 'package:mobile/componen/tab_bar_view/beranda/pc_game.dart';
import 'package:mobile/componen/tab_bar_view/beranda/semua.dart';

class TabBarViewProduk extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color.fromRGBO(0, 116, 21, 1),
                  Color.fromRGBO(23, 200, 42, 1),
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
          // backgroundColor: Colors.green,
          toolbarHeight: 4,
          bottom: TabBar(
            tabs: [
              Tab(text: 'Semua'),
              Tab(text: 'MobileGame'),
              Tab(text: 'PcGame'),
            ],
            indicatorColor: Colors.white,
            labelColor: Colors.white,
          ),
        ),
        body: TabBarView(
          children: [
            Semua(),
            MobileGame(),
            PcGame(),
          ],
        ),
      ),
    );
  }
}
