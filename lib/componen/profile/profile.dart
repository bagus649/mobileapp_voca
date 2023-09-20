// ignore_for_file: use_key_in_widget_constructors
// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mobile/componen/profil/pengaturan_item.dart';
import 'package:mobile/halaman/halaman_edit_profile.dart';

import '../../halaman/halaman_deposit.dart';
import '../../halaman/halaman_invoice_qris.dart';
import '../../halaman/halaman_voucher.dart';

import '../profil/pengaturan_switch.dart';

class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            alignment: Alignment.topRight,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Color(0xff17C82A),
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(100),
                  ),
                ),
                padding: EdgeInsets.all(20),
                child: Column(
                  children: [
                    Text('Profile',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.bold)),
                    Container(
                      child: Row(
                        children: [
                          CircleAvatar(
                            backgroundColor: Colors.orange,
                            radius: 50,
                            backgroundImage: AssetImage('assets/images/P.png'),
                          ),
                          SizedBox(width: 20),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Alexandre Saleh',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 5),
                              Text(
                                'Saleh@example.com',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
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
              Positioned(
                right: -42,
                top: -32,
                child: Container(
                  width: 100,
                  margin: EdgeInsets.only(top: 20, right: 20),
                  child: Image.asset(
                    'assets/images/ellipse58.png',
                    width: 100,
                    height: 100,
                    fit: BoxFit.fill,
                  ),
                ),
              )
            ],
          ),
          Container(
            height: 92,
            margin: EdgeInsets.all(16),
            // padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: Color(0xff17C82A),
              // boxShadow: [
              //   BoxShadow(color: Color(0xff17C82A), spreadRadius: 3),
              // ],
            ),
            child: Stack(
              children: [
                Positioned(
                  right: -20,
                  top: 0,
                  child: Image.asset(
                    'assets/images/intersect.png',
                    // width: MediaQuery.of(context).size.width,
                    height: 80,

                    fit: BoxFit.fill,
                  ),
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 26,
                    ),
                    SvgPicture.asset(
                      'assets/icons/vocacredit.svg',
                      height: 44,
                      width: 44,
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'VocaCredit',
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                          SizedBox(
                            height: 4,
                          ),
                          Text(
                            'RP 159.000 -,',
                            style: TextStyle(fontSize: 12, color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                    Spacer(),
                    Padding(
                      padding: const EdgeInsets.all(4),
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => HalamanDeposit()));
                        },
                        style: ElevatedButton.styleFrom(
                          primary: Color(0xff17C82A),
                          side: BorderSide(
                            color: Colors.white,
                            width: 1.4,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: Text(
                          'Deposit',
                          style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 26,
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 16, right: 16),
            child: Text(
              'Pengaturan',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Color(0xff7C7D82),
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              border: Border(bottom: BorderSide(color: Colors.grey)),
            ),
            child: PengaturanModel(
              title2: 'Edit Profile',
              svgurl: 'assets/icons/security.svg',
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => EditProfile()));
              },
            ),
          ),
          Container(
            decoration: BoxDecoration(
              border: Border(bottom: BorderSide(color: Colors.grey)),
            ),
            child: PengaturanModel(
              title2: 'Voucher',
              svgurl: 'assets/icons/voucher.svg',
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => HalamanVoucher()));
              },
            ),
          ),
          Container(
            decoration: BoxDecoration(
              border: Border(bottom: BorderSide(color: Colors.grey)),
            ),
            child: PengaturanSwitch(
                title2: 'Notifikasi', svgurl: 'assets/icons/notification.svg'),
          ),
          PengaturanModel(
            title2: 'Privacy',
            svgurl: 'assets/icons/privacy.svg',
            onTap: () {},
          ),
          SizedBox(
            height: 28,
          ),
          Container(
            margin: EdgeInsets.only(left: 16, right: 16),
            child: Text(
              'Lain-lain',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Color(0xff7C7D82),
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              border: Border(bottom: BorderSide(color: Colors.grey)),
            ),
            child: PengaturanModel(
              title2: 'Referall',
              svgurl: 'assets/icons/user_group.svg',
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => QrisInvoicePage()));
              },
            ),
          ),
          Container(
            decoration: BoxDecoration(
              border: Border(bottom: BorderSide(color: Colors.grey)),
            ),
            child: PengaturanModel(
              title2: 'Privacy Policy',
              svgurl: 'assets/icons/security.svg',
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => EditProfile()));
              },
            ),
          ),
          Container(
            decoration: BoxDecoration(
              border: Border(bottom: BorderSide(color: Colors.grey)),
            ),
            child: PengaturanModel(
              title2: 'Customer Support',
              svgurl: 'assets/icons/whatsapp.svg',
              onTap: () {},
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                Container(
                  height: 72,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          CircleAvatar(
                            backgroundColor: Color(0xffF3F6FB),
                            child: SvgPicture.asset('assets/icons/log_out.svg',
                                color: Color(0xffFF5944)),
                          ),
                          SizedBox(
                            width: 12,
                          ),
                          Text(
                            'Log Out',
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w400,
                                color: Color(0xffFF5944)),
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
    );
  }
}
