// To parse this JSON data, do
//
//     final viewmsgmodel = viewmsgmodelFromMap(jsonString);

import 'dart:convert';

List<Viewmsgmodel> viewmsgmodelFromMap(String str) => List<Viewmsgmodel>.from(
    json.decode(str).map((x) => Viewmsgmodel.fromMap(x)));

String viewmsgmodelToMap(List<Viewmsgmodel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toMap())));

class Viewmsgmodel {
  int id;

  String sendMsg;
  String replyMsg;
  int receiverId;
  int senderId;
  Viewmsgmodel({
    required this.id,
    required this.sendMsg,
    required this.replyMsg,
    required this.receiverId,
    required this.senderId,
  });

  factory Viewmsgmodel.fromMap(Map<String, dynamic> json) => Viewmsgmodel(
        id: json["id"],
        sendMsg: json["send_msg"],
        replyMsg: json["reply_msg"],
        receiverId: json["receiver_id"],
        senderId: json["sender_id"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "send_msg": sendMsg,
        "reply_msg": replyMsg,
        "receiver_id": receiverId,
        "sender_id": senderId,
      };
}
