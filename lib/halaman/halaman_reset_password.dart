// ignore_for_file: unused_field, prefer_final_fields

import 'package:flutter/material.dart';

import '../appbar_navbar/custom_appbar_navigasi.dart';
import 'halaman_login.dart';

class ResetPassword extends StatefulWidget {
  @override
  _ResetPasswordState createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  TextEditingController _newPasswordController = TextEditingController();
  TextEditingController _confirmPasswordController = TextEditingController();
  String? _errorMessage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarCustom(
        title: ('Reset Password'),
      ),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 340,
                    padding: EdgeInsets.only(top: 4, left: 2),
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        'Atur ulang kata sandi, dengan mengisi kata sandi baru kamu dibawah',
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Container(
                    width: 260,
                    child: Image.asset(
                      'assets/images/reset_password.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                ],
              ),
              height: MediaQuery.of(context).size.height * 0.4,
              color: Color(0xff17C82A),
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.4,
              margin: EdgeInsets.only(
                top: MediaQuery.of(context).size.height * 0.5,
              ),
              color: Colors.white,
            ),
            ForgotPasswordContainer(
              newPasswordController: _newPasswordController,
              confirmPasswordController: _confirmPasswordController,
              errorMessage: _errorMessage,
              onConfirm: () {
                final newPassword = _newPasswordController.text;
                final confirmPassword = _confirmPasswordController.text;
                _errorMessage = null;

                if (newPassword.length < 6) {
                  _errorMessage =
                      'Password harus memiliki setidaknya 6 karakter';
                } else if (newPassword != confirmPassword) {
                  _errorMessage = 'Password tidak cocok';
                } else if (!newPassword.contains(RegExp(r'[A-Z]'))) {
                  _errorMessage =
                      'Password harus memiliki setidaknya satu karakter kapital';
                }

                setState(() {});

                if (_errorMessage == null) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LoginPage()),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}

class ForgotPasswordContainer extends StatefulWidget {
  final TextEditingController newPasswordController;
  final TextEditingController confirmPasswordController;
  final String? errorMessage;
  final VoidCallback onConfirm;

  ForgotPasswordContainer({
    required this.newPasswordController,
    required this.confirmPasswordController,
    required this.errorMessage,
    required this.onConfirm,
  });

  @override
  _ForgotPasswordContainerState createState() =>
      _ForgotPasswordContainerState();
}

class _ForgotPasswordContainerState extends State<ForgotPasswordContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 440,
      margin: EdgeInsets.only(
        top: 240,
        bottom: 20,
        left: 20,
        right: 20,
      ),
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Color(0xff9396AE).withOpacity(0.60),
            blurRadius: 10,
            spreadRadius: 0.01,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(height: 20),
          Text(
            "Reset Password",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 12),
          CustomPasswordInput(
            title: 'Masukkan Password Baru',
            hintText: 'Password Baru',
            isPasswordConfirmation: false,
            controller: widget.newPasswordController,
            minLength: 6,
            errorMessage: widget.errorMessage,
          ),
          CustomPasswordInput(
            title: 'Masukkan Password Ulang',
            hintText: 'Password Ulang',
            isPasswordConfirmation: true,
            controller: widget.confirmPasswordController,
            minLength: 6,
            errorMessage: widget.errorMessage,
          ),
          SizedBox(height: 16),
          ElevatedButton(
            onPressed: widget.onConfirm,
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Color(0xff17C82A)),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
              ),
            ),
            child: Container(
              alignment: Alignment.center,
              height: 48,
              width: double.infinity,
              child: Text(
                'Konfirmasi',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
          SizedBox(height: 8),
          Text(
            'Jika kamu tidak meminta tautan pemulihan kata sandi, tolong abaikan ini.',
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.black38, fontSize: 12),
          ),
        ],
      ),
    );
  }
}

class CustomPasswordInput extends StatefulWidget {
  final String? hintText;
  final String? title;
  final bool isPasswordConfirmation;
  final TextEditingController controller;
  final int minLength;
  final String? errorMessage;

  CustomPasswordInput({
    this.hintText,
    this.title,
    this.isPasswordConfirmation = false,
    required this.controller,
    this.minLength = 6,
    this.errorMessage,
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
            controller: widget.controller,
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
          if (widget.errorMessage != null)
            Container(
              height: 12,
              alignment: Alignment.centerLeft,
              child: Text(
                widget.errorMessage!,
                style: TextStyle(color: Colors.red, fontSize: 12),
              ),
            ),
        ],
      ),
    );
  }
}
