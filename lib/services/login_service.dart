import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:realestate/constants/baseurl.dart';
import 'package:realestate/models/login_model.dart';

Future<Loginmodel> login(
  String email,
  String pswd,
) async {
  final response = await http.post(
    Uri.parse("$baseurl/api_loginData/"),
    body: jsonEncode(<String, String>{
      "email": email,
      "pswd": pswd,
    }),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=utf-8',
    },
  );
  if (response.statusCode == 200) {
    Map<String, dynamic> responseJson = json.decode(response.body);
    print('responseJson : $responseJson');
    return Loginmodel.fromMap(jsonDecode(response.body));
  } else {
    throw Exception('Failed');
  }
}
