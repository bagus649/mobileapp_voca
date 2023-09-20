// To parse this JSON data, do
//
//     final detailProduct = detailProductsFromJson(jsonString);

// ignore_for_file: file_names

import 'dart:convert';

DetailProducts detailProductsFromJson(String str) =>
    DetailProducts.fromJson(json.decode(str));

String detailProductToJson(DetailProducts data) => json.encode(data.toJson());

class DetailProducts {
  DetailProducts({
    this.id,
    this.title,
    this.subTitle,
    this.slug,
    this.description,
    this.longDescription,
    this.code,
    this.type,
    this.logoUrl,
    this.bannerUrl,
    this.helperUrl,
    this.isFeatured,
    this.isMaintenance,
    this.siteTitle,
    this.siteDescription,
    this.siteMeta,
    this.siteBannerUrl,
    this.paymentChannels,
    this.items,
    this.userInput,
    this.faqs,
    this.variants,
  });

  int? id;
  String? title;
  String? subTitle;
  String? slug;
  String? description;
  String? longDescription;
  String? code;
  String? type;
  String? logoUrl;
  String? bannerUrl;
  String? helperUrl;
  bool? isFeatured;
  bool? isMaintenance;
  String? siteTitle;
  dynamic siteDescription;
  List<dynamic>? siteMeta;
  String? siteBannerUrl;
  List<String>? paymentChannels;
  List<Item>? items;
  UserInput? userInput;
  List<Faq>? faqs;
  List<Variant>? variants;

  factory DetailProducts.fromJson(Map<String, dynamic> json) => DetailProducts(
        id: json["id"],
        title: json["title"],
        subTitle: json["subTitle"],
        slug: json["slug"],
        description: json["description"],
        longDescription: json["longDescription"],
        code: json["code"],
        type: json["type"],
        logoUrl: json["logoUrl"],
        bannerUrl: json["bannerUrl"],
        helperUrl: json["helperUrl"],
        isFeatured: json["isFeatured"],
        isMaintenance: json["isMaintenance"],
        siteTitle: json["siteTitle"],
        siteDescription: json["siteDescription"],
        siteMeta: json["siteMeta"] == null
            ? []
            : List<dynamic>.from(json["siteMeta"]!.map((x) => x)),
        siteBannerUrl: json["siteBannerUrl"],
        paymentChannels: json["paymentChannels"] == null
            ? []
            : List<String>.from(json["paymentChannels"]!.map((x) => x)),
        items: json["items"] == null
            ? []
            : List<Item>.from(json["items"]!.map((x) => Item.fromJson(x))),
        userInput: json["userInput"] == null
            ? null
            : UserInput.fromJson(json["userInput"]),
        faqs: json["faqs"] == null
            ? []
            : List<Faq>.from(json["faqs"]!.map((x) => Faq.fromJson(x))),
        variants: json["variants"] == null
            ? []
            : List<Variant>.from(
                json["variants"]!.map((x) => Variant.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "subTitle": subTitle,
        "slug": slug,
        "description": description,
        "longDescription": longDescription,
        "code": code,
        "type": type,
        "logoUrl": logoUrl,
        "bannerUrl": bannerUrl,
        "helperUrl": helperUrl,
        "isFeatured": isFeatured,
        "isMaintenance": isMaintenance,
        "siteTitle": siteTitle,
        "siteDescription": siteDescription,
        "siteMeta":
            siteMeta == null ? [] : List<dynamic>.from(siteMeta!.map((x) => x)),
        "siteBannerUrl": siteBannerUrl,
        "paymentChannels": paymentChannels == null
            ? []
            : List<dynamic>.from(paymentChannels!.map((x) => x)),
        "items": items == null
            ? []
            : List<dynamic>.from(items!.map((x) => x.toJson())),
        "userInput": userInput?.toJson(),
        "faqs": faqs == null
            ? []
            : List<dynamic>.from(faqs!.map((x) => x.toJson())),
        "variants": variants == null
            ? []
            : List<dynamic>.from(variants!.map((x) => x.toJson())),
      };
}

class Faq {
  Faq({
    this.title,
    this.content,
  });

  String? title;
  String? content;

  factory Faq.fromJson(Map<String, dynamic> json) => Faq(
        title: json["title"],
        content: json["content"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "content": content,
      };
}

class Item {
  DateTime? createdDate;
  DateTime? updatedDate;
  int? id;
  String? name;
  int? price;
  int? priceDiscount;
  String? iconUrl;
  dynamic priceInc;
  dynamic priceExc;
  int? voucherStock;
  int? sortOrder;
  bool? isActive;
  List<ProductItemMembership>? productItemMemberships;
  Variant? variant;

  Item({
    this.createdDate,
    this.updatedDate,
    this.id,
    this.name,
    this.price,
    this.priceDiscount,
    this.iconUrl,
    this.priceInc,
    this.priceExc,
    this.voucherStock,
    this.sortOrder,
    this.isActive,
    this.productItemMemberships,
    this.variant,
  });

  factory Item.fromJson(Map<String, dynamic> json) => Item(
        createdDate: json["createdDate"] == null
            ? null
            : DateTime.parse(json["createdDate"]),
        updatedDate: json["updatedDate"] == null
            ? null
            : DateTime.parse(json["updatedDate"]),
        id: json["id"],
        name: json["name"],
        price: json["price"],
        priceDiscount: json["priceDiscount"],
        iconUrl: json["iconUrl"],
        priceInc: json["priceInc"],
        priceExc: json["priceExc"],
        voucherStock: json["voucherStock"],
        sortOrder: json["sortOrder"],
        isActive: json["isActive"],
        productItemMemberships: json["productItemMemberships"] == null
            ? []
            : List<ProductItemMembership>.from(json["productItemMemberships"]!
                .map((x) => ProductItemMembership.fromJson(x))),
        variant:
            json["variant"] == null ? null : Variant.fromJson(json["variant"]),
      );

  Map<String, dynamic> toJson() => {
        "createdDate": createdDate?.toIso8601String(),
        "updatedDate": updatedDate?.toIso8601String(),
        "id": id,
        "name": name,
        "price": price,
        "priceDiscount": priceDiscount,
        "iconUrl": iconUrl,
        "priceInc": priceInc,
        "priceExc": priceExc,
        "voucherStock": voucherStock,
        "sortOrder": sortOrder,
        "isActive": isActive,
        "productItemMemberships": productItemMemberships == null
            ? []
            : List<dynamic>.from(
                productItemMemberships!.map((x) => x.toJson())),
        "variant": variant?.toJson(),
      };
}

class ProductItemMembership {
  int? price;
  Variant? membership;

  ProductItemMembership({
    this.price,
    this.membership,
  });

  factory ProductItemMembership.fromJson(Map<String, dynamic> json) =>
      ProductItemMembership(
        price: json["price"],
        membership: json["membership"] == null
            ? null
            : Variant.fromJson(json["membership"]),
      );

  Map<String, dynamic> toJson() => {
        "price": price,
        "membership": membership?.toJson(),
      };
}

class Variant {
  DateTime? createdDate;
  DateTime? updatedDate;
  int? id;
  String? name;
  int? price;
  String? iconUrl;

  Variant({
    this.createdDate,
    this.updatedDate,
    this.id,
    this.name,
    this.price,
    this.iconUrl,
  });

  factory Variant.fromJson(Map<String, dynamic> json) => Variant(
        createdDate: json["createdDate"] == null
            ? null
            : DateTime.parse(json["createdDate"]),
        updatedDate: json["updatedDate"] == null
            ? null
            : DateTime.parse(json["updatedDate"]),
        id: json["id"],
        name: json["name"],
        price: json["price"],
        iconUrl: json["iconUrl"],
      );

  Map<String, dynamic> toJson() => {
        "createdDate": createdDate?.toIso8601String(),
        "updatedDate": updatedDate?.toIso8601String(),
        "id": id,
        "name": name,
        "price": price,
        "iconUrl": iconUrl,
      };
}

class UserInput {
  UserInput({
    this.instructionText,
    this.fieldSectionTitle,
    this.itemSectionTitle,
    this.paymentSectionTitle,
    this.voucherSectionTitle,
    this.buySectionTitle,
    this.fields,
  });

  String? instructionText;
  String? fieldSectionTitle;
  String? itemSectionTitle;
  String? paymentSectionTitle;
  String? voucherSectionTitle;
  String? buySectionTitle;
  List<Field>? fields;

  factory UserInput.fromJson(Map<String, dynamic> json) => UserInput(
        instructionText: json["instructionText"],
        fieldSectionTitle: json["fieldSectionTitle"],
        itemSectionTitle: json["itemSectionTitle"],
        paymentSectionTitle: json["paymentSectionTitle"],
        voucherSectionTitle: json["voucherSectionTitle"],
        buySectionTitle: json["buySectionTitle"],
        fields: json["fields"] == null
            ? []
            : List<Field>.from(json["fields"]!.map((x) => Field.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "instructionText": instructionText,
        "fieldSectionTitle": fieldSectionTitle,
        "itemSectionTitle": itemSectionTitle,
        "paymentSectionTitle": paymentSectionTitle,
        "voucherSectionTitle": voucherSectionTitle,
        "buySectionTitle": buySectionTitle,
        "fields": fields == null
            ? []
            : List<dynamic>.from(fields!.map((x) => x.toJson())),
      };
}

class Field {
  Field({
    this.tag,
    this.attrs,
  });

  String? tag;
  Attrs? attrs;

  factory Field.fromJson(Map<String, dynamic> json) => Field(
        tag: json["tag"],
        attrs: json["attrs"] == null ? null : Attrs.fromJson(json["attrs"]),
      );

  Map<String, dynamic> toJson() => {
        "tag": tag,
        "attrs": attrs?.toJson(),
      };
}

class Attrs {
  Attrs({
    this.name,
    this.placeholder,
    this.type,
    this.datas,
    this.length,
  });

  String? name;
  String? placeholder;
  String? type;
  List<ChooseItem>? datas;
  String? length;

  factory Attrs.fromJson(Map<String, dynamic> json) => Attrs(
        name: json["name"],
        placeholder: json["placeholder"],
        type: json["type"],
        datas: json['datas'] == null
            ? []
            : List<ChooseItem>.from(
                jsonDecode(json["datas"]).map((x) => ChooseItem.fromJson(x))),
        length: json["length"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "placeholder": placeholder,
        "type": type,
        "datas": datas,
        "length": length,
      };
}

class ChooseItem {
  ChooseItem({
    this.text,
    this.value,
  });

  String? text;
  String? value;

  factory ChooseItem.fromJson(Map<String, dynamic> json) => ChooseItem(
        text: json["text"],
        value: json["value"],
      );

  Map<String, dynamic> toJson() => {
        "text": text,
        "value": value,
      };
}
