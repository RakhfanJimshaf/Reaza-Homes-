// To parse this JSON data, do
//
//     final deleteFavlistmodel = deleteFavlistmodelFromMap(jsonString);

import 'dart:convert';

DeleteFavlistmodel deleteFavlistmodelFromMap(String str) =>
    DeleteFavlistmodel.fromMap(json.decode(str));

String deleteFavlistmodelToMap(DeleteFavlistmodel data) =>
    json.encode(data.toMap());

class DeleteFavlistmodel {
  String status;

  DeleteFavlistmodel({
    required this.status,
  });

  factory DeleteFavlistmodel.fromMap(Map<String, dynamic> json) =>
      DeleteFavlistmodel(
        status: json["status"],
      );

  Map<String, dynamic> toMap() => {
        "status": status,
      };
}
