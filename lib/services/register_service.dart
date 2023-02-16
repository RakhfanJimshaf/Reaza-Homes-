import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:realestate/constants/baseurl.dart';
import 'package:realestate/models/register_model.dart';

Future<Registermodel> register(String name, String address, String email,
    String pswd, String phone) async {
  final response = await http.post(
    Uri.parse("$baseurl/api_registerData/"),
    body: jsonEncode(<String, String>{
      "name": name,
      "address": address,
      "email": email,
      "pswd": pswd,
      "phone": phone,
    }),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=utf-8',
    },
  );
  if (response.statusCode == 200) {
    Map<String, dynamic> responseJson = json.decode(response.body);
    print('responseJson : $responseJson');
    return Registermodel.fromMap(jsonDecode(response.body));
  } else {
    throw Exception('Failed');
  }
}
