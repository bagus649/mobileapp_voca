import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
// ignore_for_file: use_key_in_widget_constructors
// ignore_for_file: prefer_const_constructors

class PengaturanModel extends StatelessWidget {
  final String title2;
  final String svgurl;
  final VoidCallback? onTap;

  PengaturanModel({
    required this.title2,
    required this.svgurl,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          Container(
            height: 72,
            child: InkWell(
              onTap: onTap,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        backgroundColor: Color(0xffF3F6FB),
                        child: SvgPicture.asset(svgurl),
                      ),
                      SizedBox(
                        width: 12,
                      ),
                      Text(
                        title2,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                  IconButton(
                    onPressed: onTap,
                    icon: Icon(Icons.keyboard_arrow_right_rounded),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
