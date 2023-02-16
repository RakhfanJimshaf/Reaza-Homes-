// To parse this JSON data, do
//
//     final sendmsgmodel = sendmsgmodelFromMap(jsonString);

import 'dart:convert';

Sendmsgmodel sendmsgmodelFromMap(String str) =>
    Sendmsgmodel.fromMap(json.decode(str));

String sendmsgmodelToMap(Sendmsgmodel data) => json.encode(data.toMap());

class Sendmsgmodel {
  String status;

  Sendmsgmodel({
    required this.status,
  });

  factory Sendmsgmodel.fromMap(Map<String, dynamic> json) => Sendmsgmodel(
        status: json["status"],
      );

  Map<String, dynamic> toMap() => {
        "status": status,
      };
}
