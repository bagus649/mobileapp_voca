import 'package:get/get.dart';

class MyTabTransaksi extends GetxController {
  var selectedIndex = 0.obs;

  void changeTab(int index) {
    selectedIndex.value = index;
  }
}
