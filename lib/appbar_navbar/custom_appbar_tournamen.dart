import 'package:flutter/material.dart';

// ignore_for_file: use_key_in_widget_constructors
// ignore_for_file: prefer_const_constructors
// ignore: avoid_unnecessary_containers
class CustomAppBarTournament extends StatelessWidget
    implements PreferredSizeWidget {
  @override
  Size get preferredSize => Size.fromHeight(62);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(40),
        ),
      ),
      backgroundColor: Color.fromRGBO(23, 200, 42, 1),
      title: Container(
        child: Text(
          'Tournament',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
      centerTitle: true,
      flexibleSpace: Stack(
        children: [
          Positioned(
            left: 0,
            right: 0,
            top: -84,
            bottom: 0,
            child: ClipRRect(
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(40),
              ),
              child: Image.asset(
                'assets/images/gelombang.png',
                fit: BoxFit.fill,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
