import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

// ignore_for_file: use_key_in_widget_constructors
// ignore_for_file: prefer_const_constructors
class PengaturanSwitch extends StatefulWidget {
  final String title2;
  final String svgurl;

  // ignore: prefer_const_constructors_in_immutables
  PengaturanSwitch({
    required this.title2,
    required this.svgurl,
  });

  @override
  // ignore: library_private_types_in_public_api
  _PengaturanSwitchState createState() => _PengaturanSwitchState();
}

class _PengaturanSwitchState extends State<PengaturanSwitch> {
  bool _isSwitched = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          Container(
            height: 72,
            // margin: EdgeInsets.only(top: 8, bottom: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      backgroundColor: Color(0xffF3F6FB),
                      child: SvgPicture.asset(widget.svgurl),
                    ),
                    SizedBox(
                      width: 12,
                    ),
                    Text(
                      widget.title2,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        _isSwitched = !_isSwitched;
                      });
                    },
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Container(
                          width: 60,
                          height: 30,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: _isSwitched ? Colors.green : Colors.grey,
                          ),
                        ),
                        Positioned(
                          left: _isSwitched ? null : 5,
                          right: _isSwitched ? 5 : null,
                          child: Text(
                            _isSwitched ? 'ON' : 'OFF',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Positioned(
                          left: _isSwitched ? 5 : null,
                          right: _isSwitched ? null : 5,
                          child: Container(
                            width: 20,
                            height: 20,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
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
