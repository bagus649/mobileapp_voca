import 'package:flutter/material.dart';

class GambarTeks extends StatelessWidget {
  final String imageAsset;
  final String title;
  final String description;
  final String description2;

  GambarTeks({
    required this.imageAsset,
    required this.title,
    this.description = '',
    this.description2 = '',
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 12),
      child: Row(
        children: [
          Image.asset(
            imageAsset,
            width: 40,
            height: 40,
            fit: BoxFit.cover,
          ),
          SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment
                  .center, // Align text to the center vertically
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                if (description.isNotEmpty)
                  Text(
                    description,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                    ),
                  ),
                if (description2.isNotEmpty)
                  Text(
                    description2,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
