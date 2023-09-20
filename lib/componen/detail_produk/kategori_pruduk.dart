import 'package:flutter/material.dart';

// ignore_for_file: use_key_in_widget_constructors
// ignore_for_file: prefer_const_constructors
// ignore: avoid_unnecessary_containers
class CustomKategori extends StatefulWidget {
  final String imgAssetPath;
  final String text;

  CustomKategori({required this.imgAssetPath, required this.text});

  @override
  _CustomKategoriState createState() => _CustomKategoriState();
}

class _CustomKategoriState extends State<CustomKategori> {
  int _selectedIndex = -1; // None selected initially

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          _selectedIndex = _selectedIndex == -1 ? 0 : -1;
        });
      },
      child: Container(
        width: 100,
        margin: EdgeInsets.all(8),
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          border: Border.all(
              color: _selectedIndex == 0 ? Colors.blue : Colors.grey),
          borderRadius: BorderRadius.circular(12),
          color:
              _selectedIndex == 0 ? Colors.blue.withOpacity(0.2) : Colors.white,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              widget.imgAssetPath,
              width: 48,
              height: 48,
            ),
            SizedBox(height: 8),
            Text(
              widget.text,
              style: TextStyle(
                fontWeight:
                    _selectedIndex == 0 ? FontWeight.bold : FontWeight.normal,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
