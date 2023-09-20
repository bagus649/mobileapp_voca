// To parse this JSON data, do
//
//     final metodepembayaraan = metodepembayaraanFromJson(jsonString);

import 'dart:convert';

List<Metodepembayaraan> metodepembayaraanFromJson(String str) =>
    List<Metodepembayaraan>.from(
        json.decode(str).map((x) => Metodepembayaraan.fromJson(x)));

String metodepembayaraanToJson(List<Metodepembayaraan> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Metodepembayaraan {
  String? group;
  List<Data>? datas;

  Metodepembayaraan({
    this.group,
    this.datas,
  });

  factory Metodepembayaraan.fromJson(Map<String, dynamic> json) =>
      Metodepembayaraan(
        group: json["group"],
        datas: json["datas"] == null
            ? []
            : List<Data>.from(json["datas"]!.map((x) => Data.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "group": group,
        "datas": datas == null
            ? []
            : List<dynamic>.from(datas!.map((x) => x.toJson())),
      };
}

class Data {
  int? id;
  String? name;
  String? accountName;
  String? accountNumber;
  String? group;
  String? code;
  int? feeFlat;
  int? minAmount;
  int? maxAmount;
  String? feePercent;
  String? iconUrl;
  bool? isOnline;
  bool? isFeatured;

  Data({
    this.id,
    this.name,
    this.accountName,
    this.accountNumber,
    this.group,
    this.code,
    this.feeFlat,
    this.minAmount,
    this.maxAmount,
    this.feePercent,
    this.iconUrl,
    this.isOnline,
    this.isFeatured,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        name: json["name"],
        accountName: json["accountName"],
        accountNumber: json["accountNumber"],
        group: json["group"],
        code: json["code"],
        feeFlat: json["feeFlat"],
        minAmount: json["minAmount"],
        maxAmount: json["maxAmount"],
        feePercent: json["feePercent"],
        iconUrl: json["iconUrl"],
        isOnline: json["isOnline"],
        isFeatured: json["isFeatured"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "accountName": accountName,
        "accountNumber": accountNumber,
        "group": group,
        "code": code,
        "feeFlat": feeFlat,
        "minAmount": minAmount,
        "maxAmount": maxAmount,
        "feePercent": feePercent,
        "iconUrl": iconUrl,
        "isOnline": isOnline,
        "isFeatured": isFeatured,
      };
}
