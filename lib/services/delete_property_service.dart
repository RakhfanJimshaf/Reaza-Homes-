import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:realestate/constants/baseurl.dart';
import 'package:realestate/models/delete_property_model.dart';

Future<Deletepropertymodel> getdeleteproperty(
  String property_id,
) async {
  final response = await http.post(
    Uri.parse("$baseurl/api_deleteProperty/"),
    body: jsonEncode(<String, String>{
      "property_id": property_id,
    }),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=utf-8',
    },
  );
  if (response.statusCode == 200) {
    Map<String, dynamic> responseJson = json.decode(response.body);
    print('responseJson : $responseJson');
    return Deletepropertymodel.fromMap(jsonDecode(response.body));
  } else {
    throw Exception('Failed');
  }
}
