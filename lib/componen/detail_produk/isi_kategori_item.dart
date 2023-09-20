import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

import '../../models/json_detail_products.dart';
import 'produk_detail_controller/product_detail_controller.dart';

class ModelKategoriItem extends StatelessWidget {
  final bool isSelected;
  final void Function() onTap;
  final String? name;
  final int? price;
  final int? priceDiscount;
  final String? iconUrl;
  final Variant? variant;
  final String? code;

  ModelKategoriItem({
    required this.isSelected,
    required this.onTap,
    this.name,
    this.price,
    this.priceDiscount,
    this.iconUrl,
    this.variant,
    this.code,
  });

  String formatPrice(int? price) {
    if (price != null) {
      final priceString = price.toString();
      final parts = List<String>.generate(
        (priceString.length / 3).ceil(),
        (index) => priceString.substring(
          (priceString.length - (index + 1) * 3).clamp(0, priceString.length),
          (priceString.length - index * 3).clamp(0, priceString.length),
        ),
      );
      return parts.reversed.join('.');
    }
    return '';
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 200,
        height: 80,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              isSelected
                  ? Color(0xff00FF19).withOpacity(0.52)
                  : Color(0xffDDFFE0),
              isSelected ? Color(0xff00FFB2) : Color(0xffffffff)
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: isSelected ? Color(0xff17C82A) : Colors.transparent,
            width: 2.0,
          ),
        ),
        child: GestureDetector(
          onTap: () {
            onTap();
            final productDetail = Get.find<ProductDetailController>();
            // productDetail.setProductDetail(price.toString());

            productDetail.setProductDetail(
              name: name ?? '',
              price: price ?? 0,
              iconUrl: iconUrl ?? '',
              variant: variant ?? Variant(),
              code: code ?? '',
            );
          },
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(left: 12, right: 12, top: 8),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      children: [
                        variant != null
                            ? Flexible(
                                child: Text(
                                  variant!.name!,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                              )
                            : Flexible(
                                child: Text(
                                  name!.split(' ')[1],
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                      ],
                    ),
                    SizedBox(height: 8),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          child: CachedNetworkImage(
                            imageUrl: iconUrl ?? '',
                            placeholder: (context, url) {
                              return Shimmer.fromColors(
                                baseColor: Colors.grey[300]!,
                                highlightColor: Colors.grey[100]!,
                                child: Container(
                                  height: 40,
                                  width: 40,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                ),
                              );
                            },
                            errorWidget: (context, url, error) =>
                                Icon(Icons.error),
                            height: 40,
                            width: 40,
                            fit: BoxFit.contain,
                          ),
                          margin: EdgeInsets.only(right: 16, top: 0),
                        ),
                        Expanded(
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Flexible(
                                child: Text(
                                  name ?? '',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 8),
                    Container(
                      child: Row(
                        children: [
                          if (priceDiscount != null && priceDiscount != 0)
                            Container(
                              child: RichText(
                                text: TextSpan(
                                  text: 'Rp. ${formatPrice(priceDiscount)}',
                                  style: TextStyle(
                                    fontSize: 10.4,
                                    color: Colors.red,
                                    fontWeight: FontWeight.bold,
                                    decoration: TextDecoration.lineThrough,
                                  ),
                                ),
                              ),
                            )
                          else
                            SizedBox(height: 2),
                          Spacer(),
                          RichText(
                            text: TextSpan(
                              text: 'Rp. ${formatPrice(price)}',
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.green,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Spacer(),
              Container(
                height: 20,
                decoration: BoxDecoration(
                  color: Color(0xFF17C82A),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(13),
                    bottomRight: Radius.circular(13),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 44),
                      child: SvgPicture.asset(
                        'assets/icons/Information_circle.svg',
                        width: 16,
                        height: 16,
                      ),
                    ),
                    SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        "Informasi",
                        style: TextStyle(fontSize: 12, color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
