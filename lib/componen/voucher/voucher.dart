// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../componen/voucher/voucher_controller.dart';

class VoucherTopUp extends StatefulWidget {
  final String title;
  final String amount;
  final List<Map<String, dynamic>> paymentMethods;

  VoucherTopUp({
    required this.title,
    required this.amount,
    required this.paymentMethods,
  });

  @override
  _VoucherTopUpState createState() => _VoucherTopUpState();
}

class _VoucherTopUpState extends State<VoucherTopUp> {
  bool isExpanded = false;
  int selectedMethodIndex = -1;

  bool isPaymentMethodSelected(int index) {
    return selectedMethodIndex == index;
  }

  @override
  Widget build(BuildContext context) {
    int paymentMethodsCount = widget.paymentMethods.length;
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            // margin: EdgeInsets.all(16),
            child: ListTile(
              onTap: () {
                setState(() {
                  isExpanded = !isExpanded;
                });
              },
              title: Container(
                margin: EdgeInsets.only(
                  left: 4,
                  right: 4,
                ),
                child: Row(
                  children: [
                    Container(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        widget.title,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 8),
                      alignment: Alignment.centerLeft,
                      child: Text(
                        '($paymentMethodsCount)',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              trailing: Container(
                padding: EdgeInsets.only(top: 8, bottom: 8),
                child: Icon(
                  size: 28,
                  isExpanded
                      ? Icons.keyboard_arrow_up
                      : Icons.keyboard_arrow_down,
                  color: isPaymentMethodSelected(selectedMethodIndex)
                      ? Color(0xFF17C82A)
                      : Color(0xFF17C82A),
                ),
              ),
            ),
          ),
          if (isExpanded)
            Column(
              children: [
                for (var i = 0; i < widget.paymentMethods.length; i++)
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        child: ListTile(
                          onTap: () {
                            setState(() {
                              selectedMethodIndex = i;
                            });
                          },
                          title: Container(
                            alignment: Alignment.centerLeft,
                            child: ClipPath(
                              clipper: CustomClipPathClipper(),
                              child: Container(
                                width: double.infinity,
                                height: 168,
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    colors: [
                                      Color(0xff0D6980),
                                      Color(0xff0D6980),
                                    ],
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                  ),
                                  borderRadius: BorderRadius.circular(16),
                                ),
                                child: Stack(
                                  children: [
                                    Positioned(
                                      left: 0,
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: Color(0xff00A8A8),
                                          borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(16),
                                            bottomLeft: Radius.circular(16),
                                          ),
                                        ),
                                        alignment: Alignment.center,
                                        height: 168,
                                        width: 72,
                                        child: Container(
                                          margin: EdgeInsets.only(left: 8),
                                          height: 20,
                                          child: Transform.rotate(
                                            alignment: Alignment.center,
                                            angle: -1.5708,
                                            child: FittedBox(
                                              fit: BoxFit.cover,
                                              alignment: Alignment.center,
                                              child: Text(
                                                'DISCOUNT',
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      child: Column(
                                        children: [
                                          Container(
                                            alignment: Alignment.centerLeft,
                                            margin: EdgeInsets.only(
                                              left: 72,
                                            ),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Container(
                                                  alignment:
                                                      Alignment.centerLeft,
                                                  margin:
                                                      EdgeInsets.only(top: 4),
                                                  height: 20,
                                                  child: ElevatedButton(
                                                    onPressed: () {},
                                                    style: ElevatedButton
                                                        .styleFrom(
                                                      primary:
                                                          Color(0xffE3FDE4),
                                                      onPrimary:
                                                          Color(0xff17C82A),
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius.only(
                                                          topRight:
                                                              Radius.circular(
                                                                  10),
                                                          bottomRight:
                                                              Radius.circular(
                                                                  10),
                                                        ),
                                                      ),
                                                      minimumSize: Size(0, 24),
                                                    ),
                                                    child: Text(
                                                      widget.paymentMethods[i]
                                                          ['buttonLabel1'],
                                                      style: TextStyle(
                                                        fontSize: 12,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Container(
                                                  margin:
                                                      EdgeInsets.only(top: 4),
                                                  height: 20,
                                                  child: ElevatedButton(
                                                    onPressed: () {},
                                                    style: ElevatedButton
                                                        .styleFrom(
                                                      primary:
                                                          Color(0xffE3FDE4),
                                                      onPrimary:
                                                          Color(0xff17C82A),
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius.only(
                                                          topRight:
                                                              Radius.circular(
                                                                  10),
                                                          bottomRight:
                                                              Radius.circular(
                                                                  10),
                                                        ),
                                                      ),
                                                      minimumSize: Size(0, 24),
                                                    ),
                                                    child: Text(
                                                      widget.paymentMethods[i]
                                                          ['buttonLabel2'],
                                                      style: TextStyle(
                                                        fontSize: 12,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Container(
                                                  margin: EdgeInsets.only(
                                                      top: 12, left: 12),
                                                  height: 36,
                                                  width: 248,
                                                  child: Text(
                                                    widget.paymentMethods[i]
                                                        ['discountText'],
                                                    style: TextStyle(
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                ),
                                                Container(
                                                  margin: EdgeInsets.only(
                                                      top: 8, bottom: 8),
                                                  decoration: BoxDecoration(
                                                    border: Border(
                                                      top: BorderSide(
                                                        color: Colors.white,
                                                        width: 0.4,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Container(
                                                  child: Row(
                                                    children: [
                                                      Container(
                                                        margin: EdgeInsets.only(
                                                            left: 12),
                                                        child: Text(
                                                          widget.paymentMethods[
                                                              i]['tanggal'],
                                                          style: TextStyle(
                                                            fontSize: 12,
                                                            color: Colors.white,
                                                          ),
                                                        ),
                                                      ),
                                                      Spacer(),
                                                      Container(
                                                        height: 32,
                                                        margin: EdgeInsets.only(
                                                            right: 8),
                                                        child: ElevatedButton(
                                                          onPressed: () {},
                                                          style: ElevatedButton
                                                              .styleFrom(
                                                            primary:
                                                                Colors.white,
                                                            onPrimary: Color(
                                                                0xff17C82A),
                                                            shape:
                                                                RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          10),
                                                            ),
                                                            padding:
                                                                EdgeInsets.all(
                                                                    0),
                                                          ),
                                                          child: Row(
                                                            children: [
                                                              Container(
                                                                alignment:
                                                                    Alignment
                                                                        .center,
                                                                height: 20,
                                                                margin: EdgeInsets
                                                                    .only(
                                                                        left: 8,
                                                                        right:
                                                                            4),
                                                                child: Text(
                                                                  'Pakai Voucher',
                                                                  style:
                                                                      TextStyle(
                                                                    fontSize:
                                                                        12,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                  ),
                                                                ),
                                                              ),
                                                              Container(
                                                                alignment:
                                                                    Alignment
                                                                        .center,
                                                                margin: EdgeInsets
                                                                    .only(
                                                                        left: 4,
                                                                        right:
                                                                            4),
                                                                child: Icon(
                                                                  Icons
                                                                      .arrow_forward,
                                                                  size: 20,
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Positioned(
                                      top: -12,
                                      right: 0,
                                      child: Image.asset(
                                        'assets/images/intersect.png',
                                      ),
                                    ),
                                    Positioned(
                                      top: 8,
                                      right: 8,
                                      child: SvgPicture.asset(
                                        'assets/icons/Information_circle.svg',
                                        height: 20,
                                        width: 20,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
              ],
            ),
        ],
      ),
    );
  }
}
