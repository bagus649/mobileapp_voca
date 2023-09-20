import 'package:flutter/material.dart';

class AppBarCustom extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  const AppBarCustom({required this.title});
  @override
  Size get preferredSize => Size.fromHeight(60);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Color(0xff17C82A),
      toolbarHeight: 80,
      elevation: 0,
      title: Text(title),
      centerTitle: true,
      flexibleSpace: Stack(
        fit: StackFit.expand,
        children: [
          Positioned(
            left: -120,
            top: 0,
            bottom: -8,
            child: Image.asset(
              'assets/images/appbar_kiri.png',
              width: 200,
              height: 260,
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            right: -120,
            top: -84,
            bottom: 0,
            child: Image.asset(
              'assets/images/appbar_kanan.png',
              width: 200,
              height: 260,
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    );
  }
}
