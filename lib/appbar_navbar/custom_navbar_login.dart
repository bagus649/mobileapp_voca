// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors_in_immutables
// ignore_for_file: prefer_const_constructors
// ignore: avoid_unnecessary_containers
import 'package:flutter/material.dart';

class CustomBottomNavbarLogin extends StatelessWidget {
  final VoidCallback onRegisterClicked;

  CustomBottomNavbarLogin({required this.onRegisterClicked});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 140,
        decoration: BoxDecoration(
          color: Color.fromRGBO(23, 200, 42, 1),
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(30),
          ),
        ),
        child: Stack(fit: StackFit.expand, children: [
          Positioned(
            left: -120,
            top: 0,
            bottom: -60,
            child: Image.asset(
              'assets/images/appbar_kiri.png',
              width: 200,
              height: 260,
              fit: BoxFit.fitHeight,
            ),
          ),
          Positioned(
            right: -120,
            top: -60,
            bottom: 0,
            child: Image.asset(
              'assets/images/appbar_kanan.png',
              width: 200,
              height: 260,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 20),
            child: Center(
              child: Column(
                children: [
                  TextButton(
                      onPressed: () {},
                      style: TextButton.styleFrom(
                        foregroundColor: Colors.white,
                        side: BorderSide(
                          width: 3.0,
                          color: Colors.white,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        minimumSize: Size(300, 60),
                      ),
                      // ignore: sized_box_for_whitespace
                      child: Container(
                        width: 280,
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 6),
                          child: Row(
                            children: [
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 16),
                                child: Image.asset(
                                  'assets/icons/google.png',
                                  width: 24,
                                  height: 24,
                                ),
                              ),
                              Text(
                                'Login Dengan Google',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                ),
                              ),
                            ],
                          ),
                        ),
                      )),
                  SizedBox(height: 20),
                  // ignore: sized_box_for_whitespace
                  Container(
                    width: 300,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 2),
                          child: Text(
                            'Belum Mempunyai Akun?',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 12,
                            ),
                          ),
                        ),
                        // ignore: avoid_unnecessary_containers
                        Container(
                          child: GestureDetector(
                            onTap: onRegisterClicked,
                            child: Text(
                              ' Masuk Disini',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontSize: 12,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          )
        ]));
  }
}
