import 'package:flutter/material.dart';

import '../appbar_navbar/custom_appbar_navigasi.dart';
import 'halaman_reset_password.dart';

class OTPVerificationPage extends StatefulWidget {
  @override
  _OTPVerificationPageState createState() => _OTPVerificationPageState();
}

class _OTPVerificationPageState extends State<OTPVerificationPage> {
  List<TextEditingController> controllers = [];
  List<String> otpDigits = List.filled(6, '');
  bool isInputComplete = false;

  @override
  void initState() {
    super.initState();
    for (int i = 0; i < 6; i++) {
      controllers.add(TextEditingController());
    }
  }

  @override
  void dispose() {
    for (var controller in controllers) {
      controller.dispose();
    }
    super.dispose();
  }

  void _onVerifyPressed() {
    if (isInputComplete) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => ResetPassword()),
      );
    } else {
      final snackBar = SnackBar(
        content: Text('Masukkan kode terlebih dahulu'),
        backgroundColor: Colors.red,
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarCustom(title: ('OTP Verification Page')),
      body: SingleChildScrollView(
        physics: NeverScrollableScrollPhysics(),
        child: Stack(
          children: [
            Container(
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 12),
                  Container(
                    width: 200,
                    child: Image.asset(
                      'assets/images/verifikasi.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(height: 16),
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
              controllers: controllers,
              otpDigits: otpDigits,
              isInputComplete: isInputComplete,
              onDigitsUpdated: (updatedValue) {
                setState(() {
                  otpDigits =
                      controllers.map((controller) => controller.text).toList();
                  isInputComplete =
                      otpDigits.every((digit) => digit.isNotEmpty);
                });
              },
              onVerifyPressed: _onVerifyPressed,
            ),
          ],
        ),
      ),
    );
  }
}

class ForgotPasswordContainer extends StatefulWidget {
  final List<TextEditingController> controllers;
  final List<String> otpDigits;
  final bool isInputComplete;
  final ValueChanged<String> onDigitsUpdated;
  final VoidCallback onVerifyPressed;

  ForgotPasswordContainer({
    required this.controllers,
    required this.otpDigits,
    required this.isInputComplete,
    required this.onDigitsUpdated,
    required this.onVerifyPressed,
  });

  @override
  _ForgotPasswordContainerState createState() =>
      _ForgotPasswordContainerState();
}

class _ForgotPasswordContainerState extends State<ForgotPasswordContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 340,
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
            "Masukan Kode Verifikasi ?",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          OTPDigitField(
            controllers: widget.controllers,
            onChanged: (updatedValue) {
              widget.onDigitsUpdated(updatedValue);
            },
          ),
          Container(
            width: 300,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 2),
                  child: Text(
                    'Belum Mendapatkan Kode ?',
                    style: TextStyle(
                      color: Color(0xff79869F),
                      fontSize: 16,
                    ),
                  ),
                ),
                SizedBox(
                  width: 4,
                ),
                Container(
                  child: GestureDetector(
                    onTap: () {},
                    child: Text(
                      'Kirim Ulang',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color(0xff17C82A),
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 16,
          ),
          Container(
            width: 300,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 2),
              child: Text(
                'Masukan kode Vertifikasi yang di kirim ke nomor yang sudah di daftarkan',
                style: TextStyle(
                  color: Colors.black54,
                  fontSize: 16,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 36,
          ),
          ElevatedButton(
            onPressed: widget.onVerifyPressed,
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Color(0xff17C82A)),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16.0),
                ),
              ),
            ),
            child: Container(
              alignment: Alignment.center,
              height: 48,
              width: double.infinity,
              child: Text(
                'Verifikasi Otp',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
          SizedBox(height: 4),
          SizedBox(height: 4),
        ],
      ),
    );
  }
}

class OTPDigitField extends StatelessWidget {
  final List<TextEditingController> controllers;
  final ValueChanged<String> onChanged;

  OTPDigitField({
    required this.controllers,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              controllers.length,
              (index) => Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: OTPDigitInput(
                  controller: controllers[index],
                  isLast: index == controllers.length - 1,
                  isFirst: index == 0,
                  onChanged: (value) {
                    onChanged(value);
                  },
                ),
              ),
            ),
          ),
          SizedBox(height: 16),
        ],
      ),
    );
  }
}

class OTPDigitInput extends StatelessWidget {
  final TextEditingController controller;
  final bool isLast;
  final bool isFirst;
  final ValueChanged<String> onChanged;

  OTPDigitInput({
    required this.controller,
    required this.isLast,
    required this.isFirst,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 36,
      height: 52,
      alignment: Alignment.center,
      child: TextField(
        controller: controller,
        onChanged: (value) {
          onChanged(value);

          if (value.isNotEmpty && isLast) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ResetPassword()),
            );
          } else if (value.isNotEmpty) {
            FocusScope.of(context).nextFocus();
          } else if (value.isEmpty && !isFirst) {
            FocusScope.of(context).previousFocus();
          }
        },
        keyboardType: TextInputType.number,
        maxLength: 1,
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 20),
        decoration: InputDecoration(
          counter: Offstage(),
        ),
      ),
    );
  }
}
