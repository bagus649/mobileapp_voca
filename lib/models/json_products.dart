// To parse this JSON data, do
//
//     final products = productsFromJson(jsonString);

import 'dart:convert';

List<Products> productsFromJson(String str) =>
    List<Products>.from(json.decode(str).map((x) => Products.fromJson(x)));

String productsToJson(List<Products> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Products {
  DateTime? createdDate;
  DateTime? updatedDate;
  String? name;
  List<Product>? products;

  Products({
    this.createdDate,
    this.updatedDate,
    this.name,
    this.products,
  });

  factory Products.fromJson(Map<String, dynamic> json) => Products(
        createdDate: json["createdDate"] == null
            ? null
            : DateTime.parse(json["createdDate"]),
        updatedDate: json["updatedDate"] == null
            ? null
            : DateTime.parse(json["updatedDate"]),
        name: json["name"],
        products: json["products"] == null
            ? []
            : List<Product>.from(
                json["products"]!.map((x) => Product.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "createdDate": createdDate?.toIso8601String(),
        "updatedDate": updatedDate?.toIso8601String(),
        "name": name,
        "products": products == null
            ? []
            : List<dynamic>.from(products!.map((x) => x.toJson())),
      };
}

class Product {
  String? title;
  String? subTitle;
  String? slug;
  String? logoUrl;

  Product({
    this.title,
    this.subTitle,
    this.slug,
    this.logoUrl,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        title: json["title"],
        subTitle: json["subTitle"],
        slug: json["slug"],
        logoUrl: json["logoUrl"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "subTitle": subTitle,
        "slug": slug,
        "logoUrl": logoUrl,
      };
}
