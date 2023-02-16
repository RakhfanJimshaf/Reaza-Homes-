import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:realestate/constants/baseurl.dart';
import 'package:realestate/constants/userdata.dart';
import 'package:realestate/models/sendmsgmodel.dart';

Future<Sendmsgmodel> getSendmsg(
  String receiver_id,
  String send_msg,
) async {
  final response = await http.post(
    Uri.parse("$baseurl/api_chat/"),
    body: jsonEncode(<String, String>{
      "sender_id": (await UserData().getUId).toString(),
      "receiver_id": receiver_id,
      "send_msg": send_msg,
    }),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=utf-8',
    },
  );
  if (response.statusCode == 200) {
    Map<String, dynamic> responseJson = json.decode(response.body);
    print('responseJson : $responseJson');
    return Sendmsgmodel.fromMap(jsonDecode(response.body));
  } else {
    throw Exception('Failed');
  }
}
