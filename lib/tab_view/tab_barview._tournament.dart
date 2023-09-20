import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile/componen/tab_view/tab_view_controller/tab_beranda_controller.dart'
    as custom;

// ignore_for_file: use_key_in_widget_constructors
// ignore_for_file: prefer_const_constructors
// ignore: avoid_unnecessary_containers
class TabbedTournamen extends StatelessWidget {
  final custom.MyTabController tabController =
      Get.put(custom.MyTabController());

  final List<Widget> tabs = [
    Tab(text: 'Tab 1'),
    Tab(text: 'Tab 2'),
    Tab(text: 'Tab 3'),
  ];

  final List<Widget> tabViews = [
    Center(child: Text('Tab 1 Content')),
    Center(child: Text('Tab 2 Content')),
    Center(child: Text('Tab 3 Content')),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TabBar & TabBarView with GetX'),
        bottom: TabBar(
          tabs: tabs,
          onTap: tabController.changeTab,
        ),
      ),
      body: Obx(() => tabViews[tabController.selectedIndex.value]),
    );
  }
}
