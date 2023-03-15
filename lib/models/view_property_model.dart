// To parse this JSON data, do
//
//     final viewpropertymodel = viewpropertymodelFromMap(jsonString);

import 'dart:convert';

List<Viewpropertymodel> viewpropertymodelFromMap(String str) =>
    List<Viewpropertymodel>.from(
        json.decode(str).map((x) => Viewpropertymodel.fromMap(x)));

String viewpropertymodelToMap(List<Viewpropertymodel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toMap())));

class Viewpropertymodel {
  Viewpropertymodel({
    required this.id,
    required this.proType,
    required this.category,
    required this.location,
    required this.img,
    required this.img1,
    required this.img2,
    required this.img3,
    required this.video,
    required this.areaMeasure,
    required this.price,
    required this.description,
    required this.contact,
    required this.status,
    required this.userId,
  });

  int id;
  String proType;
  String category;
  String location;
  String img;
  String img1;
  String img2;
  String img3;
  String video;
  String areaMeasure;
  String price;
  String description;
  String contact;
  String status;
  int userId;

  factory Viewpropertymodel.fromMap(Map<String, dynamic> json) =>
      Viewpropertymodel(
        id: json["id"],
        proType: json["pro_type"],
        category: json["category"],
        location: json["location"],
        img: json["img"],
        img1: json["img1"],
        img2: json["img2"],
        img3: json["img3"],
        video: json["video"] == null ? "" : json["video"],
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
        "video": video == null ? "" : video,
        "area_measure": areaMeasure,
        "price": price,
        "description": description,
        "contact": contact,
        "status": status,
        "user_id": userId,
      };
}
