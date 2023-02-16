// To parse this JSON data, do
//
//     final viewfeedbackmodel = viewfeedbackmodelFromMap(jsonString);

import 'dart:convert';

List<Viewfeedbackmodel> viewfeedbackmodelFromMap(String str) =>
    List<Viewfeedbackmodel>.from(
        json.decode(str).map((x) => Viewfeedbackmodel.fromMap(x)));

String viewfeedbackmodelToMap(List<Viewfeedbackmodel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toMap())));

class Viewfeedbackmodel {
  int id;

  String feedback;
  dynamic date;
  String username;
  int userId;
  Viewfeedbackmodel({
    required this.id,
    required this.feedback,
    required this.date,
    required this.username,
    required this.userId,
  });

  factory Viewfeedbackmodel.fromMap(Map<String, dynamic> json) =>
      Viewfeedbackmodel(
        id: json["id"],
        feedback: json["feedback"],
        date: json["date"],
        username: json["username"],
        userId: json["user_id"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "feedback": feedback,
        "date": date,
        "username": username,
        "user_id": userId,
      };
}
