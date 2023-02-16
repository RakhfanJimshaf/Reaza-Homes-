import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:realestate/constants/baseurl.dart';
import 'package:realestate/models/deletefav_list_model.dart';

Future<DeleteFavlistmodel> getdeleteDeleteFavlist(
  String pro_id,
) async {
  final response = await http.post(
    Uri.parse("$baseurl/api_deleteFavlist/"),
    body: jsonEncode(<String, String>{
      "pro_id": pro_id,
    }),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=utf-8',
    },
  );
  if (response.statusCode == 200) {
    Map<String, dynamic> responseJson = json.decode(response.body);
    print('responseJson : $responseJson');
    return DeleteFavlistmodel.fromMap(jsonDecode(response.body));
  } else {
    throw Exception('Failed');
  }
}
