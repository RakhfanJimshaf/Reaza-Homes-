import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:realestate/constants/baseurl.dart';
import 'package:realestate/constants/userdata.dart';
import 'package:realestate/models/editprofile_model.dart';

Future<Editprofilemodel> getEditprofile(
    String email, String pswd, String address, String phone) async {
  final response = await http.post(
    Uri.parse("$baseurl/api_Editprofile/"),
    body: jsonEncode(<String, String>{
      "user_id": (await UserData().getUId).toString(),
      "email": email,
      "pswd": pswd,
      "address": address,
      "phone": phone,
    }),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=utf-8',
    },
  );
  if (response.statusCode == 200) {
    Map<String, dynamic> responseJson = json.decode(response.body);
    print('responseJson : $responseJson');
    return Editprofilemodel.fromMap(jsonDecode(response.body));
  } else {
    throw Exception('Failed');
  }
}
