import 'package:flutter/material.dart';

import '../../halaman_profile.dart';

// ignore_for_file: use_key_in_widget_constructors
// ignore_for_file: prefer_const_constructors
// ignore: avoid_unnecessary_containers
class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            child: Column(
      children: [
        HalamanProfile(),
      ],
    )));
  }
}
