import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../controller/appbar_controller.dart';

class CustomAppBarBeranda extends StatefulWidget
    implements PreferredSizeWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;
  final AppBarController appBarController = Get.put(AppBarController());

  CustomAppBarBeranda({required this.scaffoldKey, Key? key}) : super(key: key);

  @override
  Size get preferredSize => Size.fromHeight(80);

  void onSubmitted(String text) {
    appBarController.setSearchText(text);
  }

  @override
  _CustomAppBarBerandaState createState() => _CustomAppBarBerandaState();
}

class _CustomAppBarBerandaState extends State<CustomAppBarBeranda> {
  void updateValueInOtherPage(String value) {
    final appBarController = Get.find<AppBarController>();
    appBarController.setSearchText(value);
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: 80,
      backgroundColor: Color.fromRGBO(23, 200, 42, 1),
      leading: Padding(
        padding: EdgeInsets.only(left: 12, bottom: 0, right: 0, top: 0),
        child: Image.asset(
          'assets/images/vocagame_putih.png',
          width: 40.0,
          fit: BoxFit.contain,
          height: 40.0,
        ),
      ),
      title: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          color: Colors.white,
        ),
        child: Obx(() {
          final searchText = widget.appBarController.searchText.value;
          return TextField(
            // onChanged: (value) {
            //   widget.appBarController.setSearchText(value);
            // },
            onSubmitted: (value) {
              updateValueInOtherPage(value);
            },
            controller: TextEditingController(text: searchText),
            // ignore: prefer_const_constructors
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: 'Search...',
              hintStyle: TextStyle(color: Colors.black45),
              prefixIcon: Icon(Icons.search, color: Colors.black45),
            ),
          );
        }),
      ),
      actions: [
        GestureDetector(
          onTap: () {
            widget.scaffoldKey.currentState?.openEndDrawer();
          },
          child: Container(
            padding: EdgeInsets.only(right: 4),
            child: SvgPicture.asset(
              "assets/icons/Menu.svg",
            ),
          ),
        ),
      ],
      flexibleSpace: Stack(
        fit: StackFit.expand,
        children: [
          Positioned(
            left: 0,
            top: -24,
            child: Image.asset(
              'assets/images/gelombang.png',
              fit: BoxFit.fill,
            ),
          ),
        ],
      ),
    );
  }
}
