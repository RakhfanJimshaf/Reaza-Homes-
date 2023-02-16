// To parse this JSON data, do
//
//     final editprofilemodel = editprofilemodelFromMap(jsonString);

import 'dart:convert';

Editprofilemodel editprofilemodelFromMap(String str) =>
    Editprofilemodel.fromMap(json.decode(str));

String editprofilemodelToMap(Editprofilemodel data) =>
    json.encode(data.toMap());

class Editprofilemodel {
  String status;

  Editprofilemodel({
    required this.status,
  });

  factory Editprofilemodel.fromMap(Map<String, dynamic> json) =>
      Editprofilemodel(
        status: json["status"],
      );

  Map<String, dynamic> toMap() => {
        "status": status,
      };
}
