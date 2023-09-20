// ignore_for_file: unused_field

import 'package:flutter/material.dart';
import 'package:mobile/appbar_navbar/custom_appbar_navigasi.dart';

import '../componen/berita_terkini/custom_container_berita.dart';

// ignore: use_key_in_widget_constructors
class BeritaPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // ignore: prefer_const_constructors
      appBar: AppBarCustom(title: 'Semua Berita'),
      body: BeritaContainer(),
    );
  }
}

// ignore: use_key_in_widget_constructors
class BeritaContainer extends StatefulWidget {
  @override
  // ignore: library_private_types_in_public_api
  _BeritaContainerState createState() => _BeritaContainerState();
}

class _BeritaContainerState extends State<BeritaContainer> {
  // ignore: prefer_final_fields
  bool _isCarouselRunning = false;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // ignore: prefer_const_constructors
          SizedBox(
            height: 12,
          ),
          CustomContainerBerita(
            maxContainers: 10,
            isCarouselRunning: false,
          ),
        ],
      ),
    );
  }
}
