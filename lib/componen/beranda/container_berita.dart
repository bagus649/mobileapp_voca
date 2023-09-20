import 'package:flutter/material.dart';

import '../../componen/berita_terkini/detail_berita.dart';

class Berita extends StatelessWidget {
  final String imageUrl;
  final String title1;
  final String title2;

  Berita({
    required this.imageUrl,
    required this.title1,
    required this.title2,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>
                DetailPage(title1: title1, title2: title2, imageUrl: imageUrl),
          ),
        );
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 12),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Color.fromRGBO(208, 208, 208, 100)),
                borderRadius: BorderRadius.circular(10),
              ),
              margin: EdgeInsets.only(
                left: 20,
                right: 20,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 20, right: 20, top: 20),
                    height: 140,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(imageUrl),
                        fit: BoxFit.fill,
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 20, right: 20, top: 12),
                    child: Text(
                      title1,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style:
                          TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(
                        left: 20, right: 20, top: 12, bottom: 20),
                    child: Text(
                      title2,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(fontSize: 10, color: Colors.grey),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
