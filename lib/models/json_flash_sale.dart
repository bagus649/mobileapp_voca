// To parse this JSON data, do
//
//     final flashSales = flashSalesFromJson(jsonString);

import 'dart:convert';

List<FlashSales> flashSalesFromJson(String str) =>
    List<FlashSales>.from(json.decode(str).map((x) => FlashSales.fromJson(x)));

String flashSalesToJson(List<FlashSales> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class FlashSales {
  int? id;
  String? name;
  int? price;
  int? priceDiscount;
  String? iconUrl;
  Product? product;
  int? voucherStock;

  FlashSales({
    this.id,
    this.name,
    this.price,
    this.priceDiscount,
    this.iconUrl,
    this.product,
    this.voucherStock,
  });

  factory FlashSales.fromJson(Map<String, dynamic> json) => FlashSales(
        id: json["id"],
        name: json["name"],
        price: json["price"],
        priceDiscount: json["priceDiscount"],
        iconUrl: json["iconUrl"],
        product:
            json["product"] == null ? null : Product.fromJson(json["product"]),
        voucherStock: json["voucherStock"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "price": price,
        "priceDiscount": priceDiscount,
        "iconUrl": iconUrl,
        "product": product?.toJson(),
        "voucherStock": voucherStock,
      };
}

class Product {
  String? title;
  SubTitle? subTitle;
  String? slug;
  String? logoUrl;
  String? bannerUrl;

  Product({
    this.title,
    this.subTitle,
    this.slug,
    this.logoUrl,
    this.bannerUrl,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        title: json["title"],
        subTitle: subTitleValues.map[json["subTitle"]]!,
        slug: json["slug"],
        logoUrl: json["logoUrl"],
        bannerUrl: json["bannerUrl"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "subTitle": subTitleValues.reverse[subTitle],
        "slug": slug,
        "logoUrl": logoUrl,
        "bannerUrl": bannerUrl,
      };
}

enum SubTitle {
  GARENA,
  GRAVITY_CORPORATION,
  HO_YOVERSE,
  KITKA_GAMES,
  LEVEL_INFINITE,
  MOONTON,
  NET_EASE,
  PLAYWITH_INC,
  TENCENT_GAMES
}

final subTitleValues = EnumValues({
  "Garena": SubTitle.GARENA,
  "Gravity Corporation": SubTitle.GRAVITY_CORPORATION,
  "HoYoverse": SubTitle.HO_YOVERSE,
  "Kitka Games": SubTitle.KITKA_GAMES,
  "Level Infinite": SubTitle.LEVEL_INFINITE,
  "Moonton": SubTitle.MOONTON,
  "NetEase": SubTitle.NET_EASE,
  "PLAYWITH Inc": SubTitle.PLAYWITH_INC,
  "Tencent Games": SubTitle.TENCENT_GAMES
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
