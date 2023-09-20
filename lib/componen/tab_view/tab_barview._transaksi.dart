import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile/componen/tab_view/tab_view_controller/tab_transaksi_controller.dart'
    as custom;
// ignore_for_file: use_key_in_widget_constructors
// ignore_for_file: prefer_const_constructors
// ignore: avoid_unnecessary_containers

class TabBarTransaksi extends StatelessWidget {
  final custom.MyTabTransaksi tabController = Get.put(custom.MyTabTransaksi());

  final List<Widget> tabs = [
    Tab(text: 'Tab 1'),
    Tab(text: 'Tab 2'),
  ];

  final List<Widget> tabViews = [
    Center(child: Text('Tab 1 Content')),
    Center(child: Text('Tab 2 Content')),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        bottom: TabBar(
          tabs: tabs,
          onTap: tabController.changeTab,
        ),
      ),
      body: Obx(() => tabViews[tabController.selectedIndex.value]),
    );
  }
}
