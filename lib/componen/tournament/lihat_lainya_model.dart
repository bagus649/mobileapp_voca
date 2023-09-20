import 'package:flutter/material.dart';

class LihatLainya extends StatelessWidget {
  final String title1;
  final String title2;
  final IconData iconData;
  final Function() onTap;

  LihatLainya({
    required this.title1,
    required this.title2,
    required this.iconData,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title1,
            style: TextStyle(
              fontSize: 20,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          Spacer(),
          TextButton(
            onPressed: onTap,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  title2,
                  style: TextStyle(
                    fontSize: 12,
                    color: Color.fromRGBO(116, 118, 136, 1),
                  ),
                ),
                // Spacer(),
                Icon(
                  iconData,
                  color: Color.fromRGBO(116, 118, 136, 1),
                  size: 24,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
