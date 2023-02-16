// To parse this JSON data, do
//
//     final favlistmodel = favlistmodelFromMap(jsonString);

import 'dart:convert';

List<Favlistmodel> favlistmodelFromMap(String str) => List<Favlistmodel>.from(
    json.decode(str).map((x) => Favlistmodel.fromMap(x)));

String favlistmodelToMap(List<Favlistmodel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toMap())));

class Favlistmodel {
  int id;

  String favStatus;
  String proType;
  String category;
  String location;
  String img;
  String areaMeasure;
  String price;
  String description;
  String contact;
  int userId;
  int propertyId;
  Favlistmodel({
    required this.id,
    required this.favStatus,
    required this.proType,
    required this.category,
    required this.location,
    required this.img,
    required this.areaMeasure,
    required this.price,
    required this.description,
    required this.contact,
    required this.userId,
    required this.propertyId,
  });

  factory Favlistmodel.fromMap(Map<String, dynamic> json) => Favlistmodel(
        id: json["id"],
        favStatus: json["fav_status"],
        proType: json["pro_type"],
        category: json["category"],
        location: json["location"],
        img: json["img"],
        areaMeasure: json["area_measure"],
        price: json["price"],
        description: json["description"],
        contact: json["contact"],
        userId: json["user_id"],
        propertyId: json["property_id"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "fav_status": favStatus,
        "pro_type": proType,
        "category": category,
        "location": location,
        "img": img,
        "area_measure": areaMeasure,
        "price": price,
        "description": description,
        "contact": contact,
        "user_id": userId,
        "property_id": propertyId,
      };
}
