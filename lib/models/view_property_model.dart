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
  int id;
  String proType;
  String category;
  String location;
  String img;
  String areaMeasure;
  String price;
  String description;
  String contact;
  String status;
  int userId;
  // String favstatus;

  Viewpropertymodel({
    required this.id,
    required this.proType,
    required this.category,
    required this.location,
    required this.img,
    required this.areaMeasure,
    required this.price,
    required this.description,
    required this.contact,
    required this.status,
    required this.userId,
    //  required this.favstatus,
  });

  factory Viewpropertymodel.fromMap(Map<String, dynamic> json) =>
      Viewpropertymodel(
        id: json["id"],
        proType: json["pro_type"],
        category: json["category"],
        location: json["location"],
        img: json["img"],
        areaMeasure: json["area_measure"],
        price: json["price"],
        description: json["description"],
        contact: json["contact"],
        status: json["status"],
        userId: json["user_id"],
        // favstatus: json["fav_status"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "pro_type": proType,
        "category": category,
        "location": location,
        "img": img,
        "area_measure": areaMeasure,
        "price": price,
        "description": description,
        "contact": contact,
        "status": status,
        "user_id": userId,
        // "fav_status": favstatus,
      };
}
