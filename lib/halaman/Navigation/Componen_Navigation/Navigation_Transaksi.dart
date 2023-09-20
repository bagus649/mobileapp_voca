import 'package:flutter/material.dart';
// ignore_for_file: use_key_in_widget_constructors
// ignore_for_file: prefer_const_constructors
// ignore: avoid_unnecessary_containers
import '../../../bottom_navigasion_controller/tab_bar_transaksi_controller.dart';
import '../../../appbar_navbar/custom_appbar_tournamen.dart';

class Transaksi extends StatelessWidget {
  const Transaksi({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBarTournament(),
      extendBodyBehindAppBar: true,
      // ignore: avoid_unnecessary_containers
      body: Container(child: TabBarTransaksi1()),
    );
  }
}
