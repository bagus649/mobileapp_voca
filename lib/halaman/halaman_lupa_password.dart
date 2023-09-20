import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../appbar_navbar/custom_appbar_navigasi.dart';
import 'halaman_otp.dart';

class ForgotPasswordPage extends StatefulWidget {
  @override
  _ForgotPasswordPageState createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final TextEditingController _phoneController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String? _validatePhoneNumber(String? value) {
    if (value == null || value.isEmpty) {
      return 'Nomor handphone tidak boleh kosong';
    }
    if (!RegExp(r'^[0-9]*$').hasMatch(value)) {
      return 'Nomor handphone hanya boleh berisi angka';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarCustom(
        title: ('Lupa Password'),
      ),
      body: SingleChildScrollView(
        // physics: NeverScrollableScrollPhysics(),
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
                  SizedBox(height: 12),
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

            Container(
              height: 360,
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
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(height: 12),
                    Text(
                      "Masukan Nomor Telepon",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 12),
                    TextFormField(
                      controller: _phoneController,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                      ),
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                      ],
                      decoration: InputDecoration(
                        filled: true,
                        prefixIcon: Icon(
                          Icons.phone,
                          color: Color.fromRGBO(23, 200, 42, 100),
                        ),
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
                        hintText: "Masukan Nomor",
                        hintStyle: TextStyle(
                          color: Color.fromARGB(139, 120, 120, 120),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                      validator: _validatePhoneNumber,
                      keyboardType: TextInputType.phone,
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 4, left: 2),
                      child: Text.rich(TextSpan(
                          text:
                              'Masukan Nomor Handphone kamu, untuk mengirim kode verifikasi reset password',
                          style: TextStyle(color: Colors.black38))),
                    ),
                    SizedBox(height: 26),
                    ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => OTPVerificationPage()),
                          );
                        }
                      },
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Color(0xff17C82A)),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
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
                          'Kirim Otp',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                    SizedBox(height: 4),
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        alignment: Alignment.center,
                        height: 48,
                        width: double.infinity,
                        child: Text(
                          'Coba Menggunakan Email',
                          style: TextStyle(color: Colors.black54),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // ForgotPasswordContainer(),
          ],
        ),
      ),
    );
  }
}
