// To parse this JSON data, do
//
//     final registermodel = registermodelFromMap(jsonString);

import 'dart:convert';

Registermodel registermodelFromMap(String str) =>
    Registermodel.fromMap(json.decode(str));

String registermodelToMap(Registermodel data) => json.encode(data.toMap());

class Data {
  int id;

  String name;
  String email;
  String pswd;
  String address;
  String phone;
  String status;
  Data({
    required this.id,
    required this.name,
    required this.email,
    required this.pswd,
    required this.address,
    required this.phone,
    required this.status,
  });

  factory Data.fromMap(Map<String, dynamic> json) => Data(
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

class Registermodel {
  String status;

  Data data;
  Registermodel({
    required this.status,
    required this.data,
  });

  factory Registermodel.fromMap(Map<String, dynamic> json) => Registermodel(
        status: json["status"],
        data: Data.fromMap(json["data"]),
      );

  Map<String, dynamic> toMap() => {
        "status": status,
        "data": data.toMap(),
      };
}
