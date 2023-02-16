// To parse this JSON data, do
//
//     final favouriteModel = favouriteModelFromMap(jsonString);

import 'dart:convert';

FavouriteModel favouriteModelFromMap(String str) =>
    FavouriteModel.fromMap(json.decode(str));

String favouriteModelToMap(FavouriteModel data) => json.encode(data.toMap());

class FavouriteModel {
  String status;

  FavouriteModel({
    required this.status,
  });

  factory FavouriteModel.fromMap(Map<String, dynamic> json) => FavouriteModel(
        status: json["status"],
      );

  Map<String, dynamic> toMap() => {
        "status": status,
      };
}
