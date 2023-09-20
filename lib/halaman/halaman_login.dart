import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// import 'package:dio/dio.dart';
import 'package:mobile/services/service_controller.dart';

// import 'package:mobile/services/service_preferences.dart';
import 'package:mobile/services/service_provider.dart';

import '../appbar_navbar/custom_appbar_login.dart';
import '../appbar_navbar/custom_navbar_login.dart';
import 'Navigation/Bottom_Navigation.dart';
import 'halaman_lupa_password.dart';
import 'halaman_registrasi.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _isObscure3 = true;
  bool _rememberMe = false;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
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

  String? _validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password tidak boleh kosong';
    }
    if (value.length < 6) {
      return 'Password harus memiliki setidaknya 6 karakter';
    }
    // if (!value.contains(RegExp(r'[A-Z]'))) {
    //   return 'Password harus memiliki setidaknya 1 huruf kapital';
    // }
    return null;
  }

  @override
  void dispose() {
    _phoneController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _handleLogin() async {
    if (_formKey.currentState!.validate()) {
      // DialogHelper.showLoading();

      var response = await ServiceProvider.postData(
        '/auth/member/login',
        data: {
          "phoneNumber": _phoneController.text,
          "password": _passwordController.text,
        },
      ).catchError(ServiceController().handleErrorya);

      if (response == null) return;

      if (response != null) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => BottomNavigasion()),
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
            MaterialPageRoute(builder: (context) => Registrasi()),
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
                        SizedBox(height: 20),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Center(
                                child: Text(
                                  "Login",
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
                              Padding(
                                padding: EdgeInsets.symmetric(vertical: 10),
                                child: Text(
                                  'Nomor Handphone',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
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
                                  hintText: "    Masukan Nomor",
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
                              SizedBox(height: 20),
                              Padding(
                                padding: EdgeInsets.symmetric(vertical: 10),
                                child: Text(
                                  'Password',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              TextFormField(
                                controller: _passwordController,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                ),
                                obscureText: _isObscure3,
                                decoration: InputDecoration(
                                  suffixIcon: IconButton(
                                    icon: Icon(_isObscure3
                                        ? Icons.visibility_off
                                        : Icons.visibility),
                                    onPressed: () {
                                      setState(() {
                                        _isObscure3 = !_isObscure3;
                                      });
                                    },
                                  ),
                                  filled: true,
                                  prefixIcon: Icon(
                                    Icons.lock,
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
                                  hintText: "    Password",
                                  hintStyle: TextStyle(
                                    color: Color.fromARGB(139, 120, 120, 120),
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                ),
                                validator: _validatePassword,
                                keyboardType: TextInputType.text,
                              ),
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
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              ForgotPasswordPage(),
                                        ),
                                      );
                                    },
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(
                                        vertical: 10,
                                      ),
                                      child: Text(
                                        'Forgot Password?',
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 16,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 20),
                              SizedBox(height: 10),
                              Center(
                                child: TextButton(
                                  onPressed: _handleLogin,
                                  style: TextButton.styleFrom(
                                    foregroundColor:
                                        Color.fromRGBO(23, 200, 42, 100),
                                    side: BorderSide(
                                      width: 3.0,
                                      color: Color.fromRGBO(23, 200, 42, 100),
                                    ),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(40),
                                    ),
                                    minimumSize: Size(260, 50),
                                  ),
                                  child: Text(
                                    'Masuk',
                                    style: TextStyle(
                                      color: Color.fromRGBO(23, 200, 42, 100),
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
