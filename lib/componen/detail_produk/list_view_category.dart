import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../models/json_detail_products.dart';

class Category extends StatefulWidget {
  final bool isSelected;
  final VoidCallback onTap;
  final String? name;
  final String? iconUrl;
  final Variant? variant;
  final int? variantId;
  Category({
    required this.isSelected,
    required this.onTap,
    this.name,
    this.iconUrl,
    this.variant,
    this.variantId,
  });

  @override
  _CategoryState createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
  Color backgroundColor = Colors.white;
  Color borderColor = Colors.transparent;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          backgroundColor = widget.isSelected
              ? Color.fromARGB(255, 194, 242, 198).withOpacity(0.24)
              : Colors.white;
          borderColor = widget.isSelected
              ? Color(0xff1AC727).withOpacity(0.40)
              : Colors.transparent;
        });

        widget.onTap();
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 4),
        width: 120,
        padding: EdgeInsets.zero,
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: widget.isSelected ? Colors.green : Colors.black12,
            width: 2,
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CachedNetworkImage(
              imageUrl: widget.variant!.iconUrl!,
              placeholder: (context, url) {
                return Shimmer.fromColors(
                  baseColor: Colors.grey[300]!,
                  highlightColor: Colors.grey[100]!,
                  child: Container(
                    height: 40,
                    width: 60,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                );
              },
              errorWidget: (context, url, error) => Icon(Icons.error),
              height: 40,
              width: 60,
              fit: BoxFit.contain,
            ),
            SizedBox(height: 4),
            Text(
              widget.variant!.name!,
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: widget.isSelected ? Colors.green : Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
