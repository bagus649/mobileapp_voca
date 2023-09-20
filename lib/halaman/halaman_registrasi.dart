import 'package:flutter/material.dart';

import 'package:mobile/services/service_controller.dart';
import 'package:mobile/services/service_provider.dart';

import '../appbar_navbar/custom_appbar_login.dart';
import '../appbar_navbar/custom_navbar_login.dart';

import '../componen/lain_lain/custom_text_field3.dart';
import 'halaman_login.dart';

class Registrasi extends StatefulWidget {
  @override
  _RegistrasiState createState() => _RegistrasiState();
}

class _RegistrasiState extends State<Registrasi> {
  bool _isObscurePassword = true;
  bool _rememberMe = false;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _namadepanController = TextEditingController();
  final TextEditingController _namablakangController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  String? _validatePhoneNumber(String? value) {
    if (value == null || value.isEmpty) {
      return 'Nomor handphone tidak boleh kosong';
    }
    if (!RegExp(r'^[0-9]*$').hasMatch(value)) {
      return 'Nomor handphone hanya boleh berisi angka';
    }
    return null;
  }

  String? _validateNama(String? value) {
    if (value == null || value.isEmpty) {
      return 'Nama tidak boleh kosong';
    }
    if (value.length < 3) {
      return 'Nama harus memiliki setidaknya 3 karakter';
    }
    return null;
  }

  String? _validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password tidak boleh kosong';
    }
    if (value.length < 6) {
      return 'Password harus memiliki setidaknya 6 karakter';
    }
    return null;
  }

  @override
  void dispose() {
    _phoneController.dispose();
    _passwordController.dispose();
    _namablakangController.dispose();
    _namadepanController.dispose();
    super.dispose();
  }

  void _handleRegistration() async {
    if (_formKey.currentState!.validate()) {
      // DialogHelper.showLoading();

      var response = await ServiceProvider.postData(
        '/auth/register',
        data: {
          "firstName": _namadepanController.text,
          "lastName": _namablakangController.text,
          "phoneNumber": _phoneController.text,
          "password": _passwordController.text,
        },
      ).catchError(ServiceController().handleErrorya);

      if (response == null) return;

      if (response != null) {
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text("Registrasi Berhasil"),
              content: Text("Akun Anda telah berhasil didaftarkan."),
              actions: [
                TextButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => LoginPage(),
                        ),
                      );
                    }
                  },
                  child: Text("OK"),
                ),
              ],
            );
          },
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBarLogin(),
      bottomNavigationBar: CustomBottomNavbarLogin(
        onRegisterClicked: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => LoginPage()),
          );
        },
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              color: Colors.white,
              child: Center(
                child: Container(
                  margin: EdgeInsets.all(12),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        // SizedBox(height: 20),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Center(
                                child: Text(
                                  "Register",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                    fontSize: 32,
                                  ),
                                ),
                              ),
                              SizedBox(height: 20),
                              Center(
                                child: Text(
                                  "Untuk menikmati banyak fitur di aplikasi VocaGame",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 14,
                                  ),
                                ),
                              ),
                              SizedBox(height: 20),
                              CustomTextField3(
                                title: 'Nama Depan',
                                hintText: 'Masukkan Nama Depan',
                                controller: _namadepanController,
                                validator: _validateNama,
                              ),
                              SizedBox(height: 8),
                              CustomTextField3(
                                title: 'Nama Belakang',
                                hintText: 'Masukkan Nama Belakang',
                                controller: _namablakangController,
                                validator: _validateNama,
                              ),
                              SizedBox(height: 8),
                              CustomTextField3(
                                title: 'Nomor Handphone',
                                hintText: 'Masukkan Nomor',
                                controller: _phoneController,
                                numericOnly: true,
                                validator: _validatePhoneNumber,
                              ),
                              SizedBox(height: 8),
                              CustomTextField3(
                                title: 'Password',
                                hintText: 'Masukkan Password',
                                controller: _passwordController,
                                showPassword: true,
                                obscureText: _isObscurePassword,
                                showPasswordIcon: true,
                                validator: _validatePassword,
                              ),
                              SizedBox(height: 20),
                              Row(
                                children: [
                                  Expanded(
                                    child: Row(
                                      children: [
                                        Checkbox(
                                          shape: CircleBorder(),
                                          value: _rememberMe,
                                          onChanged: (bool? newValue) {
                                            setState(() {
                                              _rememberMe = newValue!;
                                            });
                                          },
                                        ),
                                        Text(
                                          'Remember Me',
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 16,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 20),
                              SizedBox(height: 10),
                              Center(
                                child: ElevatedButton(
                                  onPressed: _handleRegistration,
                                  style: ElevatedButton.styleFrom(
                                    primary: Color(0xff17C82A),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(40),
                                    ),
                                    minimumSize: Size(260, 50),
                                  ),
                                  child: Text(
                                    'Daftar',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height: 20),
                              Center(
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Image.asset('assets/icons/line.png'),
                                    Padding(
                                      padding: EdgeInsets.symmetric(
                                        horizontal: 18,
                                      ),
                                      child: Text('Atau'),
                                    ),
                                    Image.asset('assets/icons/line.png'),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
