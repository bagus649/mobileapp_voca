// ignore_for_file: use_key_in_widget_constructors
// ignore_for_file: prefer_const_constructors
// ignore: avoid_unnecessary_containers
import 'package:flutter/material.dart';
import 'package:mobile/componen/tab_bar_view/tournamen/berlangsung.dart';
import 'package:mobile/componen/tab_bar_view/tournamen/mendatang.dart';
import 'package:mobile/componen/tab_bar_view/tournamen/selesai.dart';

import '../componen/tab_bar_view/tournamen/semua.dart';

class TabBarTournamen1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
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
          toolbarHeight: 4,
          bottom: TabBar(
            isScrollable: true,
            tabs: [
              Tab(
                child: Text(
                  'Semua Tournament',
                  style: TextStyle(
                    fontSize: 16, // Set font size
                    fontWeight: FontWeight.w500, // Set font weight
                  ),
                ),
              ),
              Tab(
                child: Text(
                  'Tournament Mendatang',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              Tab(
                child: Text(
                  'Tournament Berlangsung',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              Tab(
                child: Text(
                  'Tournament Selesai',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
            indicatorColor: Color(0xff6EFF7D),
            labelColor: Colors.white,
          ),
        ),
        body: TabBarView(
          children: [
            SemuaTournamen(),
            TournamenMendatang(),
            TournamenBerlangsung(),
            TournamenSelesai(),
          ],
        ),
      ),
    );
  }
}
