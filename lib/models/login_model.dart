// To parse this JSON data, do
//
//     final loginmodel = loginmodelFromMap(jsonString);

import 'dart:convert';

Loginmodel loginmodelFromMap(String str) =>
    Loginmodel.fromMap(json.decode(str));

String loginmodelToMap(Loginmodel data) => json.encode(data.toMap());

class Loginmodel {
  String status;

  int id;
  String name;
  String email;
  String pswd;
  Loginmodel({
    required this.status,
    required this.id,
    required this.name,
    required this.email,
    required this.pswd,
  });

  factory Loginmodel.fromMap(Map<String, dynamic> json) => Loginmodel(
        status: json["status"],
        id: json["id"],
        name: json["name"],
        email: json["email"],
        pswd: json["pswd"],
      );

  Map<String, dynamic> toMap() => {
        "status": status,
        "id": id,
        "name": name,
        "email": email,
        "pswd": pswd,
      };
}
