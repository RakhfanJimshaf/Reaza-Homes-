import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:realestate/constants/baseurl.dart';
import 'package:realestate/constants/userdata.dart';
import 'package:realestate/models/view_msg_model.dart';

Future<List<Viewmsgmodel>> getViewmsg(String receiver_id) async {
  var url = baseurl + "/api_viewChat/";
  final res = await http.post(
    Uri.parse(url),
    body: jsonEncode(<String, dynamic>{
      "sender_id": (await UserData().getUId).toString(),
      "receiver_id": receiver_id
    }),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=utf-8',
    },
  );
  if (res.statusCode == 200) {
    List jsonResponse = json.decode(res.body);
    print(jsonResponse);
    return jsonResponse
        .map((property) => new Viewmsgmodel.fromMap(property))
        .toList();
  } else {
    throw Exception('Failed');
  }
}
