// To parse this JSON data, do
//
//     final mypropertiesmodel = mypropertiesmodelFromMap(jsonString);

import 'dart:convert';

List<Mypropertiesmodel> mypropertiesmodelFromMap(String str) =>
    List<Mypropertiesmodel>.from(
        json.decode(str).map((x) => Mypropertiesmodel.fromMap(x)));

String mypropertiesmodelToMap(List<Mypropertiesmodel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toMap())));

class Mypropertiesmodel {
  int id;

  String proType;
  String category;
  String location;
  String img;
  String img1;
  String img2;
  String img3;

  String areaMeasure;
  String price;
  String description;
  String contact;
  String status;
  int userId;
  Mypropertiesmodel({
    required this.id,
    required this.proType,
    required this.category,
    required this.location,
    required this.img,
    required this.img1,
    required this.img2,
    required this.img3,
    required this.areaMeasure,
    required this.price,
    required this.description,
    required this.contact,
    required this.status,
    required this.userId,
  });

  factory Mypropertiesmodel.fromMap(Map<String, dynamic> json) =>
      Mypropertiesmodel(
        id: json["id"],
        proType: json["pro_type"],
        category: json["category"],
        location: json["location"],
        img: json["img"],
        img1: json["img1"],
        img2: json["img2"],
        img3: json["img3"],
        areaMeasure: json["area_measure"],
        price: json["price"],
        description: json["description"],
        contact: json["contact"],
        status: json["status"],
        userId: json["user_id"],
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
        "area_measure": areaMeasure,
        "price": price,
        "description": description,
        "contact": contact,
        "status": status,
        "user_id": userId,
      };
}
