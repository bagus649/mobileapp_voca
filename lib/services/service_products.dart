// ignore_for_file: use_rethrow_when_possible

import 'package:dio/dio.dart';

import '../models/json_products.dart';

class ProductService2 {
  final Dio dio = Dio();
  final String baseUrl = 'https://api-staging.vocagame.com/v1/category/product';

  Future<List<Products>> fetchProducts() async {
    try {
      final Response response = await dio.get('$baseUrl/products');
      if (response.statusCode == 200) {
        final List<dynamic> data = response.data['data'];
        return data.map((x) => Products.fromJson(x)).toList();
      } else {
        throw Exception('Gagal memuat produk');
      }
    } catch (e) {
      throw e;
    }
  }
}
