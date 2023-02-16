// To parse this JSON data, do
//
//     final placeordermodel = placeordermodelFromMap(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

Placeordermodel placeordermodelFromMap(String str) => Placeordermodel.fromMap(json.decode(str));

String placeordermodelToMap(Placeordermodel data) => json.encode(data.toMap());

class Placeordermodel {
    Placeordermodel({
        required this.status,
    });

    final String status;

    factory Placeordermodel.fromMap(Map<String, dynamic> json) => Placeordermodel(
        status: json["status"],
    );

    Map<String, dynamic> toMap() => {
        "status": status,
    };
}
