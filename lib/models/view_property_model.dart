// To parse this JSON data, do
//
//     final viewpropertymodel = viewpropertymodelFromMap(jsonString);

import 'dart:convert';

class Viewpropertymodel {
  Viewpropertymodel({
    this.data,
  });

  List<Datum>? data;

  factory Viewpropertymodel.fromJson(String str) =>
      Viewpropertymodel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Viewpropertymodel.fromMap(Map<String, dynamic> json) =>
      Viewpropertymodel(
        data: json["data"] == null
            ? []
            : List<Datum>.from(json["data"]!.map((x) => Datum.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "data":
            data == null ? [] : List<dynamic>.from(data!.map((x) => x.toMap())),
      };
}

class Datum {
  Datum({
    this.id,
    this.proType,
    this.category,
    this.location,
    this.img,
    this.img1,
    this.img2,
    this.img3,
    this.video,
    this.areaMeasure,
    this.price,
    this.description,
    this.contact,
    this.status,
    this.userId,
    this.name,
  });

  int? id;
  String? proType;
  String? category;
  String? location;
  String? img;
  String? img1;
  String? img2;
  String? img3;
  String? video;
  String? areaMeasure;
  String? price;
  String? description;
  String? contact;
  String? status;
  int? userId;
  String? name;

  factory Datum.fromJson(String str) => Datum.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Datum.fromMap(Map<String, dynamic> json) => Datum(
        id: json["id"],
        proType: json["pro_type"],
        category: json["category"],
        location: json["location"],
        img: json["img"],
        img1: json["img1"],
        img2: json["img2"],
        img3: json["img3"],
        video: json["video"],
        areaMeasure: json["area_measure"],
        price: json["price"],
        description: json["description"],
        contact: json["contact"],
        status: json["status"],
        userId: json["user_id"],
        name: json["name"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "pro_type": proType,
        "category": category,
        "location": location,
        "img": img,
        "img1": img1,
        "img2": img2,
        "img3": img3,
        "video": video,
        "area_measure": areaMeasure,
        "price": price,
        "description": description,
        "contact": contact,
        "status": status,
        "user_id": userId,
        "name": name,
      };
}
