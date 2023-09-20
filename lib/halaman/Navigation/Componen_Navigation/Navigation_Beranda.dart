import 'package:flutter/material.dart';

import 'package:mobile/bottom_navigasion_controller/tab_bar_beranda_controller.dart';

import '../../../appbar_navbar/custom_appbar_beranda.dart';
import '../../../componen/side_menu/side_menu.dart';

class Beranda extends StatelessWidget {
  Beranda({Key? key}) : super(key: key);

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: CustomAppBarBeranda(
        scaffoldKey: _scaffoldKey,
      ),
      endDrawer: SideMenu(),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: TabBarViewProduk(),
      ),
    );
  }
}
