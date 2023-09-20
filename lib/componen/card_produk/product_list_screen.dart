import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile/componen/beranda/cardproduk_item.dart';

import 'package:mobile/halaman/halaman_detail_produk_api.dart';

import 'package:mobile/services/service_provider.dart';
import 'package:shimmer/shimmer.dart';

import '../../appbar_navbar/custom_appbar_beranda.dart';
import '../../models/json_products.dart';

class ProductCardController extends GetxController {
  var logoUrl = RxString('');
  var title = RxString('');

  void setProductCard(String newLogoUrl, String newTitle) {
    logoUrl.value = newLogoUrl;
    title.value = newTitle;
  }
}

class ProductListScreen extends StatefulWidget {
  const ProductListScreen({Key? key}) : super(key: key);

  @override
  _ProductListScreenState createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  List<Products> productList = [];
  final ProductCardController productDetail = Get.put(ProductCardController());
  final CustomAppBarBeranda appBar = Get.find<CustomAppBarBeranda>();

  @override
  void initState() {
    ambilData();
    super.initState();
  }

  Future<void> ambilData() async {
    try {
      var response = await ServiceProvider.getData(
        '/category/product',
      );

      if (response != null) {
        setState(() {
          productList =
              (response.data as List).map((x) => Products.fromJson(x)).toList();
        });
      }
    } catch (error) {
      print(error);
    }
  }

  @override
  Widget build(BuildContext context) {
    final value = appBar.appBarController.searchText.value.toLowerCase();

    return productList.isEmpty
        ? Shimmer.fromColors(
            baseColor: Colors.grey[300]!,
            highlightColor: Colors.grey[100]!,
            child: Container(
              height: 400,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          )
        : SingleChildScrollView(
            child: Column(
              children: productList.map((products) {
                final filteredProducts = products.products!
                    .where((product) =>
                        product.title!.toLowerCase().contains(value) ||
                        value.isEmpty)
                    .toList();

                if (filteredProducts.isEmpty) {
                  return Container(
                      child: SizedBox(
                    width: 2,
                  ));
                } else {
                  return Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 12, right: 12, top: 8),
                        child: Row(
                          children: [
                            Container(
                              margin: EdgeInsets.symmetric(vertical: 4),
                              child: Text(
                                (products.name!),
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      Container(
                        child: GridView.builder(
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            mainAxisExtent: 168,
                            childAspectRatio: 0.8,
                          ),
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            final product = filteredProducts[index];
                            return ProductCard(
                              imageUrl: product.logoUrl!,
                              title1: product.title!,
                              title2: product.subTitle!,
                              onTap: () {
                                productDetail.setProductCard(
                                    product.logoUrl!, product.title!);

                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => ProductDetailApi(
                                      slug: product.slug!,
                                    ),
                                  ),
                                );
                              },
                            );
                          },
                          itemCount: filteredProducts.length,
                        ),
                      ),
                    ],
                  );
                }
              }).toList(),
            ),
          );
  }
}
