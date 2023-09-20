import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextField3 extends StatefulWidget {
  final String title;
  final String hintText;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final double? titleFontSize;
  final FontWeight? titleFontWeight;
  final bool isRedBorder;
  final bool obscureText;
  final bool numericOnly;
  final bool showPasswordIcon;
  final bool showPassword;

  CustomTextField3({
    required this.title,
    required this.hintText,
    required this.controller,
    required this.validator,
    this.titleFontSize,
    this.titleFontWeight,
    this.isRedBorder = false,
    this.obscureText = false,
    this.numericOnly = false,
    this.showPasswordIcon = true,
    this.showPassword = true,
  });

  @override
  _CustomTextField3State createState() => _CustomTextField3State();
}

class _CustomTextField3State extends State<CustomTextField3> {
  bool _isObscureText = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
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
            obscureText:
                widget.showPassword && _isObscureText && widget.obscureText,
            inputFormatters: widget.numericOnly
                ? [FilteringTextInputFormatter.digitsOnly]
                : [],
            decoration: InputDecoration(
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
              suffixIcon: widget.obscureText && widget.showPasswordIcon
                  ? IconButton(
                      icon: Icon(
                        _isObscureText
                            ? Icons.visibility
                            : Icons.visibility_off,
                      ),
                      onPressed: () {
                        setState(() {
                          _isObscureText = !_isObscureText;
                        });
                      },
                    )
                  : null,
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16.0),
                borderSide: BorderSide(
                  color: Colors.red,
                ),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16.0),
                borderSide: BorderSide(
                  color: Colors.red,
                ),
              ),
            ),
            validator: widget.validator,
          ),
          // if (widget.validator != null &&
          //     widget.validator!(widget.controller.text) != null)
          //   Text(
          //     widget.validator!(widget.controller.text)!,
          //     style: TextStyle(
          //       color: Colors.red,
          //       fontSize: 14.0,
          //     ),
          //   ),
        ],
      ),
    );
  }
}
