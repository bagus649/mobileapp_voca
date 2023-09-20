// ignore_for_file: sort_child_properties_last

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:mobile/componen/detail_produk/isi_kategori_item.dart';
import 'package:mobile/componen/detail_produk/list_view_category.dart';
import 'package:mobile/componen/detail_produk/produk_detail_controller/product_detail_controller.dart';

import 'package:mobile/services/service_provider.dart';
import 'dart:convert';

import 'package:shimmer/shimmer.dart';

import '../../models/json_detail_products.dart';

enum ItemType {
  Category1,
  Category2,
  Category3,
}

class CategoryProdukApi extends StatefulWidget {
  final void Function(ItemType? selected) onItemSelected;
  final String slug;

  CategoryProdukApi({required this.onItemSelected, required this.slug});

  @override
  _CategoryProdukApiState createState() => _CategoryProdukApiState();
}

class _CategoryProdukApiState extends State<CategoryProdukApi> {
  ItemType selectedItem = ItemType.Category1;
  int selectedProductIndex = -1;

  List<Item>? items;
  List<Variant>? variants;
  String? code;

  DetailProducts? data;

  @override
  void initState() {
    super.initState();
    ambilData();
  }

  int _getVariantIdByItemType(ItemType type) {
    switch (type) {
      case ItemType.Category1:
        return 1;
      case ItemType.Category2:
        return 2;
      case ItemType.Category3:
        return 3;
      default:
        return 1;
    }
  }

  Future<void> ambilData() async {
    try {
      var response = await ServiceProvider.getData('/product/${widget.slug}');
      if (response != null) {
        var jsonString = json.encode(response.data);
        data = detailProductsFromJson(jsonString);

        setState(() {
          variants = data?.variants;
        });

        if (variants != null && variants!.isNotEmpty) {
          items = data?.items
              ?.where((item) =>
                  item.variant != null &&
                  item.variant!.id == _getVariantIdByItemType(selectedItem))
              .toList();
        } else {
          items = data?.items;
        }

        code = data?.code ?? '';
      }
    } catch (error) {
      print('Error in HTTP request: $error');
    }
  }

  Widget _buildSelectedItem(ItemType type) {
    if (items == null) {
      return Shimmer.fromColors(
        baseColor: Colors.grey[300]!,
        highlightColor: Colors.grey[100]!,
        child: Container(
          height: double.maxFinite,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      );
    }

    if (items!.isEmpty) {
      return Text('');
    }

    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 16),
            child: Text(
              'Pilih Item',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            margin: EdgeInsets.all(12),
            child: GridView.builder(
              padding: EdgeInsets.zero,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 12.0,
                crossAxisSpacing: 12.0,
                mainAxisExtent: 132,
              ),
              physics: NeverScrollableScrollPhysics(),
              itemCount: items?.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                final item = items![index];
                return ModelKategoriItem(
                  onTap: () {
                    setState(() {
                      selectedProductIndex = index;
                    });
                    final productDetail = Get.find<ProductDetailController>();
                    productDetail.setProductDetail(
                      name: item.name ?? '',
                      price: item.price ?? 0,
                      iconUrl: item.iconUrl ?? '',
                      variant: item.variant ?? Variant(),
                      code: code ?? '',
                    );
                    widget.onItemSelected(selectedItem);
                  },
                  iconUrl: item.iconUrl,
                  name: item.name,
                  price: item.price,
                  priceDiscount: item.priceDiscount,
                  variant: item.variant,
                  isSelected: selectedProductIndex == index,
                  code: code,
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  final ProductDetailController productDetail =
      Get.put(ProductDetailController());

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        alignment: Alignment.centerLeft,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (variants != null && variants!.isNotEmpty)
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 16),
                      child: Text(
                        'Pilih Category',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    Container(
                      height: 100,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: variants?.length ?? 0,
                        itemBuilder: (BuildContext context, int index) {
                          final variant = variants![index];

                          return Category(
                            isSelected: selectedItem == ItemType.values[index],
                            onTap: () {
                              setState(() {
                                selectedItem = ItemType.values[index];
                                selectedProductIndex = -1;
                              });
                              ambilData();
                            },
                            name: variant.name,
                            iconUrl: variant.iconUrl,
                            variant: variant,
                            variantId: variant.id,
                          );
                        },
                      ),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                  ],
                ),
              )
            else
              SizedBox(
                height: 4,
              ),
            _buildSelectedItem(selectedItem),
          ],
        ),
      ),
    );
  }
}
