import 'dart:convert';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:mobile/services/service_provider.dart';
import 'package:shimmer/shimmer.dart';

import '../../models/json_metode_pembayaraan.dart';
import '../detail_produk/produk_detail_controller/product_detail_controller.dart';

class PaymentMethodController extends GetxController {
  RxString selectedMethodName = ''.obs;
  RxString selectedIconUrl = ''.obs;

  void setSelectedMethod(String Newname, String NewiconUrl) {
    selectedMethodName.value = Newname;
    selectedIconUrl.value = NewiconUrl;
  }
}

// ignore: must_be_immutable
class CardPembayarann extends StatefulWidget {
  final String amount;
  int selectedIndex;
  final Function(String) onMethodSelected;
  final Function(bool) onTextFieldChanged;
  final String selectedMethod;

  CardPembayarann({
    required this.amount,
    required this.selectedIndex,
    required this.onMethodSelected,
    required this.onTextFieldChanged,
    required this.selectedMethod,
  });

  @override
  _CardPembayarannState createState() => _CardPembayarannState();
}

class _CardPembayarannState extends State<CardPembayarann> {
  String? selectedMethod;
  List<Metodepembayaraan> metodePembayaranList = [];

  @override
  void initState() {
    super.initState();
    ambilData();
  }

  Future<void> ambilData() async {
    try {
      var response = await ServiceProvider.getData('/payment');
      if (response != null) {
        var jsonString = json.encode(response.data);
        List<Metodepembayaraan> data = metodepembayaraanFromJson(jsonString);
        setState(() {
          metodePembayaranList = data;
        });
      }
    } catch (error) {
      print('Error in HTTP request: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          for (var groupData in metodePembayaranList)
            GroupContainer(
              groupData: groupData,
              amount: widget.amount,
              selectedMethodName: widget.selectedMethod,
              selectedIconUrl: widget.selectedMethod,
              onMethodSelected: (methodName) {
                setState(() {
                  widget.onMethodSelected(methodName);
                });
              },
            ),
        ],
      ),
    );
  }
}

class GroupContainer extends StatefulWidget {
  final Metodepembayaraan groupData;
  final String amount;
  final String? selectedMethodName;
  final String? selectedIconUrl;

  final Function(String) onMethodSelected;

  GroupContainer({
    required this.groupData,
    required this.amount,
    required this.selectedMethodName,
    required this.selectedIconUrl,
    required this.onMethodSelected,
  });

  @override
  _GroupContainerState createState() => _GroupContainerState();
}

class _GroupContainerState extends State<GroupContainer> {
  bool isExpanded = false;
  final ProductDetailController productDetail =
      Get.put(ProductDetailController());
  final PaymentMethodController paymentMethodController = Get.find();
  String formatPrice(int? price) {
    if (price != null) {
      final priceString = price.toString();
      final parts = List<String>.generate(
        (priceString.length / 3).ceil(),
        (index) => priceString.substring(
          (priceString.length - (index + 1) * 3).clamp(0, priceString.length),
          (priceString.length - index * 3).clamp(0, priceString.length),
        ),
      );
      return parts.reversed.join('.');
    }
    return '';
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.black12,
            borderRadius: BorderRadius.circular(32),
            border: Border.all(
              width: 1.8,
              color: Colors.black12,
            ),
          ),
          child: ListTile(
            onTap: () {
              setState(() {
                isExpanded = !isExpanded;
              });
            },
            title: Container(
              margin: EdgeInsets.only(left: 16, right: 16, top: 8, bottom: 8),
              child: Column(
                children: [
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Row(
                      children: [
                        Text(
                          widget.groupData.group ?? '',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        Row(
                          children: [
                            if (widget.groupData.datas != null)
                              for (var data in widget.groupData.datas!.take(3))
                                Container(
                                  margin: EdgeInsets.only(right: 8),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(8),
                                    child: Container(
                                      color: Colors.white.withOpacity(0.8),
                                      child: CachedNetworkImage(
                                        imageUrl: data.iconUrl ?? '',
                                        placeholder: (context, url) {
                                          return Shimmer.fromColors(
                                            baseColor: Colors.grey[300]!,
                                            highlightColor: Colors.grey[100]!,
                                            child: Container(
                                              height: 40,
                                              width: 40,
                                            ),
                                          );
                                        },
                                        errorWidget: (context, url, error) =>
                                            Icon(Icons.error),
                                        height: 32,
                                        width: 32,
                                        fit: BoxFit.contain,
                                      ),
                                    ),
                                  ),
                                ),
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            trailing: Icon(isExpanded
                ? Icons.keyboard_arrow_up
                : Icons.keyboard_arrow_down),
          ),
        ),
        if (isExpanded)
          Column(
            children: [
              for (var data in widget.groupData.datas ?? [])
                Container(
                  width: 340,
                  padding: EdgeInsets.all(4),
                  margin: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: widget.selectedMethodName == data.name &&
                            widget.selectedIconUrl == data.iconUrl
                        ? Color(0xffD7FFDB)
                        : Colors.black12,
                    borderRadius: BorderRadius.circular(32),
                    border: Border.all(
                      width: 1.8,
                      color: widget.selectedMethodName == data.name &&
                              widget.selectedIconUrl == data.iconUrl
                          ? Color(0xff17C82A)
                          : Colors.transparent,
                    ),
                  ),
                  child: ListTile(
                    onTap: () {
                      widget.onMethodSelected(
                        data.name ?? '',
                      );
                      paymentMethodController.setSelectedMethod(
                          data.name ?? '', data.iconUrl ?? '');

                      // widget.onMethodSelected(data.name ?? '');
                    },
                    trailing: Icon(
                      widget.selectedMethodName == data.name &&
                              widget.selectedIconUrl == data.iconUrl
                          ? Icons.radio_button_checked
                          : Icons.radio_button_unchecked,
                      color: widget.selectedMethodName == data.name &&
                              widget.selectedIconUrl == data.iconUrl
                          ? Color(0xff17C82A)
                          : Colors.black,
                      size: 24,
                    ),
                    title: Container(
                      alignment: Alignment.centerLeft,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(data.name ?? ''),
                          Text(
                            'Rp. ${formatPrice(productDetail.price.value)}',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                    leading: Container(
                      margin: EdgeInsets.only(right: 8),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Container(
                          color: Colors.white.withOpacity(0.8),
                          child: CachedNetworkImage(
                            imageUrl: data.iconUrl ?? '',
                            placeholder: (context, url) {
                              return Shimmer.fromColors(
                                baseColor: Colors.grey[300]!,
                                highlightColor: Colors.grey[100]!,
                                child: Container(
                                  height: 40,
                                  width: 40,
                                ),
                              );
                            },
                            errorWidget: (context, url, error) =>
                                Icon(Icons.error),
                            height: 40,
                            width: 40,
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                    ),

                    // leading: Image.network(
                    //   data.iconUrl ?? '',
                    //   width: 60,
                    //   height: 60,
                    // ),
                  ),
                ),
            ],
          ),
      ],
    );
  }
}
