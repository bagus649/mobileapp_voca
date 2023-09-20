import 'package:get/get.dart';

class BottomNavigasionController extends GetxController {
  var currentIndex = 0.obs;
  void onChange(int index) {
    currentIndex.value = index;
    update();
  }
}
