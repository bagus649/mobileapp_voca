import 'package:get/get.dart';

import '../../../models/json_detail_products.dart';

class ProductDetailController extends GetxController {
  final RxString name = ''.obs;
  final RxInt price = 0.obs;
  final RxString iconUrl = ''.obs;
  final Rx<Variant?> variant = Rx<Variant?>(null);
  final RxString code = ''.obs;

  void setProductDetail({
    required String name,
    required int price,
    required String iconUrl,
    required Variant variant,
    required String code,
  }) {
    this.code.value = code;
    this.name.value = name;
    this.price.value = price;
    this.iconUrl.value = iconUrl;
    this.variant.value = variant;
  }
}
