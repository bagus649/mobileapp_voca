// ignore_for_file: prefer_const_constructors_in_immutables, avoid_unnecessary_containers, use_key_in_widget_constructors

import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:mobile/componen/card_produk/custom_container.dart';

// ignore: camel_case_types
class Custom_Container_Title extends StatelessWidget {
  final String iconImagePath;
  final String title;

  Custom_Container_Title({
    required this.iconImagePath,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      // ignore: prefer_const_constructors
      margin: EdgeInsets.only(top: 20),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              // height: 200,
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 20, right: 20),
                    child: Row(
                      children: [
                        Container(
                          margin: EdgeInsets.only(right: 8),
                          child: Image.asset(
                            iconImagePath,
                            fit: BoxFit.contain,
                            height: 24,
                          ),
                        ),
                        Text(
                          title,
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
