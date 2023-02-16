import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:realestate/constants/baseurl.dart';
import 'package:realestate/constants/userdata.dart';
import 'package:realestate/models/postfeedback_model.dart';

Future<Postfeedbackmodel> getPostfeedback(
  String feedback,
) async {
  final response = await http.post(
    Uri.parse("$baseurl/api_addFeedback/"),
    body: jsonEncode(<String, String>{
      "user_id": (await UserData().getUId).toString(),
      "feedback": feedback,
    }),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=utf-8',
    },
  );
  if (response.statusCode == 200) {
    Map<String, dynamic> responseJson = json.decode(response.body);
    print('responseJson : $responseJson');
    return Postfeedbackmodel.fromMap(jsonDecode(response.body));
  } else {
    throw Exception('Failed');
  }
}
