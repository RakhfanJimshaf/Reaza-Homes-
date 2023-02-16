// To parse this JSON data, do
//
//     final chatuserlistmodel = chatuserlistmodelFromMap(jsonString);

import 'dart:convert';

List<Chatuserlistmodel> chatuserlistmodelFromMap(String str) =>
    List<Chatuserlistmodel>.from(
        json.decode(str).map((x) => Chatuserlistmodel.fromMap(x)));

String chatuserlistmodelToMap(List<Chatuserlistmodel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toMap())));

class Chatuserlistmodel {
  int id;

  String name;
  String email;
  String pswd;
  String address;
  String phone;
  String status;
  Chatuserlistmodel({
    required this.id,
    required this.name,
    required this.email,
    required this.pswd,
    required this.address,
    required this.phone,
    required this.status,
  });

  factory Chatuserlistmodel.fromMap(Map<String, dynamic> json) =>
      Chatuserlistmodel(
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
