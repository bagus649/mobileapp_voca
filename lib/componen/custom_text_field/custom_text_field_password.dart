import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomPasswordInput extends StatefulWidget {
  final String? svgIcon;
  final String? hintText;
  final String? title;
  final bool isPasswordConfirmation;
  final TextEditingController controller;

  CustomPasswordInput({
    this.svgIcon,
    this.hintText,
    this.title,
    this.isPasswordConfirmation = false,
    required this.controller,
  });

  @override
  _CustomPasswordInputState createState() => _CustomPasswordInputState();
}

class _CustomPasswordInputState extends State<CustomPasswordInput> {
  bool _isFilled = false;
  bool _isObscure = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 4, bottom: 4),
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(top: 8, bottom: 8),
            alignment: Alignment.centerLeft,
            child: Text(
              widget.title ?? '',
              style: TextStyle(
                color: Colors.black,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          TextField(
            controller: widget.controller, // Gunakan controller yang sesuai
            onChanged: (value) {
              setState(() {
                _isFilled = value.isNotEmpty;
              });
            },
            obscureText: _isObscure,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(
                  color: _isFilled ? Colors.green : Colors.grey,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: Colors.green, width: 2),
              ),
              hintText: widget.hintText ?? '',
              prefixIcon: widget.svgIcon != null
                  ? Container(
                      padding: const EdgeInsets.all(12.8),
                      child: Container(
                        child: SvgPicture.asset(
                          widget.svgIcon!,
                          fit: BoxFit.contain,
                          color: _isFilled ? Colors.green : Colors.grey,
                        ),
                      ),
                    )
                  : null,
              suffixIcon: IconButton(
                icon: Icon(
                  _isObscure ? Icons.visibility : Icons.visibility_off,
                  color: Colors.grey,
                ),
                onPressed: () {
                  setState(() {
                    _isObscure = !_isObscure;
                  });
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
