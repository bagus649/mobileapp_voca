import 'package:flutter/material.dart';

class CustomTextField2 extends StatefulWidget {
  final String title;
  final String hintText;
  final TextEditingController controller;
  final ValueChanged<String> onChanged;
  final double? titleFontSize;
  final FontWeight? titleFontWeight;
  final bool isRedBorder;

  CustomTextField2({
    required this.title,
    required this.hintText,
    required this.controller,
    required this.onChanged,
    this.titleFontSize,
    this.titleFontWeight,
    this.isRedBorder = false,
  });

  @override
  _CustomTextField2State createState() => _CustomTextField2State();
}

class _CustomTextField2State extends State<CustomTextField2> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.title,
            style: TextStyle(
              fontSize: widget.titleFontSize ?? 16,
              fontWeight: widget.titleFontWeight ?? FontWeight.w500,
            ),
          ),
          SizedBox(
            height: 8,
          ),
          TextFormField(
            controller: widget.controller,
            decoration: InputDecoration(
              helperText: widget.isRedBorder ? 'Isi Bagian Ini' : null,
              helperStyle: TextStyle(color: Colors.red),
              labelText: widget.hintText,
              floatingLabelBehavior: FloatingLabelBehavior.never,
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16.0),
                borderSide: BorderSide(
                  color: widget.isRedBorder ? Colors.red : Colors.grey,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16.0),
                borderSide: BorderSide(
                  color: Colors.green,
                ),
              ),
              contentPadding:
                  EdgeInsets.symmetric(vertical: 16.0, horizontal: 16),
            ),
            onChanged: widget.onChanged,
          )
        ],
      ),
    );
  }
}
