import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextField extends StatelessWidget {
  final String title;
  final String hintText;
  final String svgIcon;
  final TextEditingController controller;

  CustomTextField({
    required this.title,
    required this.hintText,
    required this.svgIcon,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            color: Colors.black,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        TextFormField(
          controller: controller,
          keyboardType: TextInputType.phone,
          style: TextStyle(
            color: Colors.black,
            fontSize: 16,
          ),
          decoration: InputDecoration(
            filled: true,
            prefixIcon: Image.asset(svgIcon),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(
                width: 3.0,
                color: Color.fromRGBO(248, 247, 251, 100),
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: BorderSide(
                width: 3.0,
                color: Color.fromRGBO(23, 200, 42, 100),
              ),
            ),
            hintText: "    $hintText",
            hintStyle: TextStyle(
              color: Color.fromARGB(139, 120, 120, 120),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
            ),
          ),
        ),
      ],
    );
  }
}
