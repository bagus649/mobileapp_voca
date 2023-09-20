import 'package:flutter/material.dart';
// ignore_for_file: use_key_in_widget_constructors
// ignore_for_file: prefer_const_constructors
// ignore: avoid_unnecessary_containers

class CustomClipPathClipper extends CustomClipper<Path> {
  final double leftCircleOffsetX;
  final double rightCircleOffsetX;

  CustomClipPathClipper({
    this.leftCircleOffsetX = 0.4,
    this.rightCircleOffsetX = 0.4,
  });

  @override
  Path getClip(Size size) {
    final path = Path()
      ..moveTo(0, size.height)
      ..lineTo(size.width, size.height)
      ..lineTo(size.width, 0)
      ..lineTo(0, 0)
      ..close();

    final holeRadius = 16.8;
    final holeOffsetY = size.height / 2;

    path.addOval(
      Rect.fromCircle(
        center: Offset(leftCircleOffsetX, holeOffsetY),
        radius: holeRadius,
      ),
    );

    path.addOval(
      Rect.fromCircle(
        center: Offset(size.width - rightCircleOffsetX, holeOffsetY),
        radius: holeRadius,
      ),
    );

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}
