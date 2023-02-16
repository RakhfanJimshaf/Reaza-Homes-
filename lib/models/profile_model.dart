// To parse this JSON data, do
//
//     final profilemodel = profilemodelFromMap(jsonString);

import 'dart:convert';

List<Profilemodel> profilemodelFromMap(String str) => List<Profilemodel>.from(
    json.decode(str).map((x) => Profilemodel.fromMap(x)));

String profilemodelToMap(List<Profilemodel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toMap())));

class Profilemodel {
  int id;

  String name;
  String email;
  String pswd;
  String address;
  String phone;
  String status;
  Profilemodel({
    required this.id,
    required this.name,
    required this.email,
    required this.pswd,
    required this.address,
    required this.phone,
    required this.status,
  });

  factory Profilemodel.fromMap(Map<String, dynamic> json) => Profilemodel(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        pswd: json["pswd"],
        address: json["address"],
        phone: json["phone"],
        status: json["status"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "email": email,
        "pswd": pswd,
        "address": address,
        "phone": phone,
        "status": status,
      };
}
