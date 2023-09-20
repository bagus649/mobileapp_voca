// import 'package:curved_navigation_bar/curved_navigation_bar.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:get/get.dart';
// import 'package:mobile/Navigation/Componen_Navigation/Navigation_Beranda.dart';
// import 'package:mobile/Navigation/Componen_Navigation/Navigation_Profile.dart';
// import 'package:mobile/Navigation/Componen_Navigation/Navigation_Tournament.dart';
// import 'package:mobile/Navigation/Componen_Navigation/Navigation_Transaksi.dart';
// import '../controller/bottom_navigasion_controller.dart';

// class BottomNavigasion extends StatelessWidget {
//   const BottomNavigasion({Key? key});

//   @override
//   Widget build(BuildContext context) {
//     final screens = [
//       Beranda(),
//       Tournament(),
//       Transaksi(),
//       Profile(),
//     ];
//     return GetBuilder<BottomNavigasionController>(builder: (controller) {
//       return Scaffold(
//         body: Obx(() => IndexedStack(
//               index: controller.currentIndex.value,
//               children: screens,
//             )),
//         bottomNavigationBar: Stack(
//           children: [
//             CurvedNavigationBar(
//               backgroundColor: Colors.transparent,
//               onTap: (value) {
//                 controller.onChange(value);
//               },
//               index: controller.currentIndex.value,
//               items: [
//                 SvgPicture.asset(
//                   'assets/icons/beranda.svg',
//                   color: controller.currentIndex.value == 0
//                       ? Color(0xff17C82A)
//                       : Colors.grey,
//                 ),
//                 SvgPicture.asset(
//                   'assets/icons/tournament.svg',
//                   color: controller.currentIndex.value == 1
//                       ? Color(0xff17C82A)
//                       : Colors.grey,
//                 ),
//                 SvgPicture.asset(
//                   'assets/icons/transaksi.svg',
//                   color: controller.currentIndex.value == 2
//                       ? Color(0xff17C82A)
//                       : Colors.grey,
//                 ),
//                 SvgPicture.asset(
//                   'assets/icons/profile.svg',
//                   color: controller.currentIndex.value == 3
//                       ? Color(0xff17C82A)
//                       : Colors.grey,
//                 ),
//               ],
//               animationCurve: Curves.easeInOut,
//             ),
//             Positioned(
//               bottom: 10.0,
//               left: 0,
//               right: 0,
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceAround,
//                 children: [
//                   Text(
//                     'Beranda',
//                     style: TextStyle(
//                       color: controller.currentIndex.value == 0
//                           ? Color(0xff17C82A)
//                           : Colors.grey,
//                     ),
//                   ),
//                   Text(
//                     'Tournament',
//                     style: TextStyle(
//                       color: controller.currentIndex.value == 1
//                           ? Color(0xff17C82A)
//                           : Colors.grey,
//                     ),
//                   ),
//                   Text(
//                     'Transaksi',
//                     style: TextStyle(
//                       color: controller.currentIndex.value == 2
//                           ? Color(0xff17C82A)
//                           : Colors.grey,
//                     ),
//                   ),
//                   Text(
//                     'Profile',
//                     style: TextStyle(
//                       color: controller.currentIndex.value == 3
//                           ? Color(0xff17C82A)
//                           : Colors.grey,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       );
//     });
//   }
// }

import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:mobile/halaman/Navigation/Componen_Navigation/Navigation_Beranda.dart';
import 'package:mobile/halaman/Navigation/Componen_Navigation/Navigation_Profile.dart';

import '../../bottom_navigasion_controller/bottom_navigasion_controller.dart';
import 'Componen_Navigation/Navigation_Tournament.dart';
import 'Componen_Navigation/Navigation_Transaksi.dart';

class BottomNavigasion extends StatelessWidget {
  const BottomNavigasion({Key? key});

  @override
  Widget build(BuildContext context) {
    final screens = [
      Beranda(),
      Tournament(),
      Transaksi(),
      Profile(),
    ];
    return GetBuilder<BottomNavigasionController>(builder: (controller) {
      return Scaffold(
        body: Obx(() => IndexedStack(
              index: controller.currentIndex.value,
              children: screens,
            )),
        bottomNavigationBar: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Color(0xff17C82A),
                    spreadRadius: 20,
                    blurRadius: 100,
                    offset: Offset(0, 80),
                  ),
                ],
              ),
              child: CurvedNavigationBar(
                height: 56,
                backgroundColor: Colors.white.withOpacity(0.02),
                onTap: (value) {
                  controller.onChange(value);
                },
                index: controller.currentIndex.value,
                items: [
                  SvgPicture.asset(
                    'assets/icons/beranda.svg',
                    color: controller.currentIndex.value == 0
                        ? Color(0xff17C82A)
                        : Colors.grey,
                  ),
                  SvgPicture.asset(
                    'assets/icons/tournament.svg',
                    color: controller.currentIndex.value == 1
                        ? Color(0xff17C82A)
                        : Colors.grey,
                  ),
                  SvgPicture.asset(
                    'assets/icons/transaksi.svg',
                    color: controller.currentIndex.value == 2
                        ? Color(0xff17C82A)
                        : Colors.grey,
                  ),
                  SvgPicture.asset(
                    'assets/icons/profile.svg',
                    color: controller.currentIndex.value == 3
                        ? Color(0xff17C82A)
                        : Colors.grey,
                  ),
                ],
                animationCurve: Curves.easeInOut,
              ),
            ),
            Container(
              // height: 8,
              // padding: const EdgeInsets.only(top: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    alignment: Alignment.center,
                    width: 80,
                    margin: EdgeInsets.only(left: 4),
                    child: Text(
                      'Beranda',
                      style: TextStyle(
                        color: controller.currentIndex.value == 0
                            ? Color(0xff17C82A)
                            : Colors.grey,
                      ),
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    width: 80,
                    margin: EdgeInsets.only(
                      left: 4,
                    ),
                    child: Text(
                      'Tournament',
                      style: TextStyle(
                        color: controller.currentIndex.value == 1
                            ? Color(0xff17C82A)
                            : Colors.grey,
                      ),
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    width: 80,
                    margin: EdgeInsets.only(
                      left: 4,
                    ),
                    child: Text(
                      'Transaksi',
                      style: TextStyle(
                        color: controller.currentIndex.value == 2
                            ? Color(0xff17C82A)
                            : Colors.grey,
                      ),
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    width: 80,
                    margin: EdgeInsets.only(left: 4),
                    child: Text(
                      'Profile',
                      style: TextStyle(
                        color: controller.currentIndex.value == 3
                            ? Color(0xff17C82A)
                            : Colors.grey,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    });
  }
}
