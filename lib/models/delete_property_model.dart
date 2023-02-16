// To parse this JSON data, do
//
//     final deletepropertymodel = deletepropertymodelFromMap(jsonString);

import 'dart:convert';

Deletepropertymodel deletepropertymodelFromMap(String str) =>
    Deletepropertymodel.fromMap(json.decode(str));

String deletepropertymodelToMap(Deletepropertymodel data) =>
    json.encode(data.toMap());

class Deletepropertymodel {
  String status;

  Deletepropertymodel({
    required this.status,
  });

  factory Deletepropertymodel.fromMap(Map<String, dynamic> json) =>
      Deletepropertymodel(
        status: json["status"],
      );

  Map<String, dynamic> toMap() => {
        "status": status,
      };
}
