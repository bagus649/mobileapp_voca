import 'package:flutter/material.dart';
// ignore_for_file: use_key_in_widget_constructors
// ignore_for_file: prefer_const_constructors

class BuatTournament extends StatelessWidget {
  final String imageUrl;
  final String title1;
  final String title2;

  // ignore: prefer_const_constructors_in_immutables
  BuatTournament({
    required this.imageUrl,
    required this.title1,
    required this.title2,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 16),
      child: Column(
        children: [
          Stack(
            children: [
              Positioned(
                child: Container(
                  width: 420,
                  decoration: BoxDecoration(
                    border:
                        Border.all(color: Color.fromRGBO(208, 208, 208, 100)),
                    borderRadius: BorderRadius.circular(10),
                    color: Color(0xFFE3FDE4),
                  ),
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  child: Container(
                    // Wrapping the content in a Stack
                    alignment: Alignment.centerLeft,
                    child: // Aligning the image to the right

                        Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title1,
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          title2,
                          style:
                              TextStyle(fontSize: 16, color: Color(0xFF484D70)),
                        ),
                        SizedBox(height: 8),
                        TextButton(
                          // ignore: sort_child_properties_last
                          child: Text(
                            'Buat sekarang',
                            style: TextStyle(color: Colors.white),
                          ),
                          style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(Color(0xFF17C82A))),
                          onPressed: () {},
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Positioned(
                  height: 162,
                  width: 128,
                  top: 32,
                  right: 32,
                  // ignore: avoid_unnecessary_containers
                  child: Container(
                    child: Image.asset(
                      imageUrl,
                      fit: BoxFit.fill,
                    ),
                  )),
            ],
          )
        ],
      ),
    );
  }
}
