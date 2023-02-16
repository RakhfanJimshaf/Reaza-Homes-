// To parse this JSON data, do
//
//     final postfeedbackmodel = postfeedbackmodelFromMap(jsonString);

import 'dart:convert';

Postfeedbackmodel postfeedbackmodelFromMap(String str) =>
    Postfeedbackmodel.fromMap(json.decode(str));

String postfeedbackmodelToMap(Postfeedbackmodel data) =>
    json.encode(data.toMap());

class Postfeedbackmodel {
  String status;

  Postfeedbackmodel({
    required this.status,
  });

  factory Postfeedbackmodel.fromMap(Map<String, dynamic> json) =>
      Postfeedbackmodel(
        status: json["status"],
      );

  Map<String, dynamic> toMap() => {
        "status": status,
      };
}
