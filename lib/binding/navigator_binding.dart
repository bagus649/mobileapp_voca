import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile/controller/appbar_controller.dart';

import '../bottom_navigasion_controller/bottom_navigasion_controller.dart';
import '../appbar_navbar/custom_appbar_beranda.dart';
import '../componen/pembayaraan/card_metode_pembayaraan.dart';

class NavigationBinding implements Bindings {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  void dependencies() {
    Get.lazyPut(() => BottomNavigasionController());
    Get.lazyPut(() => PaymentMethodController());
    Get.lazyPut(() => AppBarController());
    Get.lazyPut(() => CustomAppBarBeranda(
          scaffoldKey: _scaffoldKey,
        ));
  }
}
