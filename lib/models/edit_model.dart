// To parse this JSON data, do
//
//     final editpropertymodel = editpropertymodelFromMap(jsonString);

import 'dart:convert';

Editpropertymodel editpropertymodelFromMap(String str) =>
    Editpropertymodel.fromMap(json.decode(str));

String editpropertymodelToMap(Editpropertymodel data) =>
    json.encode(data.toMap());

class Datum {
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
  Datum({
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

  factory Datum.fromMap(Map<String, dynamic> json) => Datum(
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

class Editpropertymodel {
  String status;

  List<Datum> data;
  Editpropertymodel({
    required this.status,
    required this.data,
  });

  factory Editpropertymodel.fromMap(Map<String, dynamic> json) =>
      Editpropertymodel(
        status: json["status"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "status": status,
        "data": List<dynamic>.from(data.map((x) => x.toMap())),
      };
}
