// ignore_for_file: use_key_in_widget_constructors, sized_box_for_whitespace
// ignore_for_file: prefer_const_constructors
// ignore: avoid_unnecessary_containers
import 'package:flutter/material.dart';

class CustomAppBarLogin extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => Size.fromHeight(100);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: 100,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(30),
        ),
      ),
      backgroundColor: Color.fromRGBO(23, 200, 42, 1),
      automaticallyImplyLeading: false,
      flexibleSpace: Stack(
        fit: StackFit.expand,
        children: [
          Positioned(
            left: -120,
            top: 0,
            bottom: -60,
            child: Image.asset(
              'assets/images/appbar_kiri.png',
              width: 200,
              height: 260,
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            right: -120,
            top: -60,
            bottom: 0,
            child: Image.asset(
              'assets/images/appbar_kanan.png',
              width: 200,
              height: 260,
              fit: BoxFit.cover,
            ),
          ),
          Center(
            child: Container(
              width: double.infinity,
              child: Image.asset(
                'assets/images/vocagame_putih.png',
                height: 60,
                fit: BoxFit.fitHeight,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
