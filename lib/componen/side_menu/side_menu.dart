import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../halaman/halaman_detail_produk_api.dart';
import '../../halaman/halaman_lacak_pesanan.dart';
import '../../halaman/halaman_login.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Drawer(
        backgroundColor: Color(0xff17C82A),
        child: ListView(
          children: [
            Stack(
              alignment: Alignment.topRight,
              children: [
                Container(
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: Colors.black12,
                        width: 1,
                      ),
                    ),
                  ),
                  padding: EdgeInsets.all(12),
                  child: Column(
                    children: [
                      Container(
                        child: Row(
                          children: [
                            CircleAvatar(
                              backgroundColor: Colors.orange,
                              radius: 50,
                              backgroundImage:
                                  AssetImage('assets/images/P.png'),
                            ),
                            SizedBox(width: 20),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Alexandre',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: 4),
                                Text(
                                  'Alex@example.com',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 12,
                                  ),
                                ),
                                SizedBox(height: 5),
                                Text(
                                  '08223181282',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            DrawerListTile(
              title: "Semua Games",
              svgSrc: "assets/icons/semua_game.svg",
              press: () {},
            ),
            DrawerListTile(
              title: "Voucher",
              svgSrc: "assets/icons/side_voucher.svg",
              press: () {},
            ),
            DrawerListTile(
              title: "Lacak Pesanan",
              svgSrc: "assets/icons/lacak.svg",
              press: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => LacakPesanan()));
              },
            ),
            DrawerListTile(
              title: "Hubungi Kami",
              svgSrc: "assets/icons/hubungi.svg",
              press: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ProductDetailApi(
                              slug: 'mobile-legends-bang-bang',
                            )));
              },
            ),
            DrawerListTile(
              title: "Tentang Kami",
              svgSrc: "assets/icons/tentang_kami.svg",
              press: () {},
            ),
            DrawerListTile(
              title: "Log Out",
              svgSrc: "assets/icons/log_out.svg",
              press: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => LoginPage()));
              },
            ),
          ],
        ),
      ),
    );
  }
}

class DrawerListTile extends StatelessWidget {
  const DrawerListTile({
    Key? key,
    required this.title,
    required this.svgSrc,
    required this.press,
  }) : super(key: key);

  final String title, svgSrc;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: press,
      horizontalTitleGap: 0.0,
      leading: SvgPicture.asset(
        svgSrc,
        color: Colors.white,
        height: 30,
      ),
      title: Text(
        title,
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}
