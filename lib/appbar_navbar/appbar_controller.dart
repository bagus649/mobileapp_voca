import 'package:get/get.dart';

class AppBarController extends GetxController {
  final searchText = ''.obs;

  void setSearchText(String value) {
    searchText.value = value;
  }
}
