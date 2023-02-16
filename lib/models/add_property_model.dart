// To parse this JSON data, do
//
//     final addpropertymodel = addpropertymodelFromMap(jsonString);

import 'dart:convert';

Addpropertymodel addpropertymodelFromMap(String str) =>
    Addpropertymodel.fromMap(json.decode(str));

String addpropertymodelToMap(Addpropertymodel data) =>
    json.encode(data.toMap());

class Addpropertymodel {
  String status;

  Data data;
  Addpropertymodel({
    required this.status,
    required this.data,
  });

  factory Addpropertymodel.fromMap(Map<String, dynamic> json) =>
      Addpropertymodel(
        status: json["status"],
        data: Data.fromMap(json["data"]),
      );

  Map<String, dynamic> toMap() => {
        "status": status,
        "data": data.toMap(),
      };
}

class Data {
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
  Data({
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
  });

  factory Data.fromMap(Map<String, dynamic> json) => Data(
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
      };
}
