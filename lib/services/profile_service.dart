import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:realestate/constants/baseurl.dart';
import 'package:realestate/constants/userdata.dart';
import 'package:realestate/models/profile_model.dart';

Future<List<Profilemodel>> getProfile() async {
  var url = baseurl + "/api_profileData/";
  final res = await http.post(
    Uri.parse(url),
    body: jsonEncode(<String, dynamic>{
      "user_id": (await UserData().getUId).toString(),
    }),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=utf-8',
    },
  );
  if (res.statusCode == 200) {
    List jsonResponse = json.decode(res.body);
    print(jsonResponse);
    return jsonResponse
        .map((property) => new Profilemodel.fromMap(property))
        .toList();
  } else {
    throw Exception('Failed');
  }
}
