import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:realestate/constants/baseurl.dart';
import 'package:realestate/constants/userdata.dart';
import 'package:realestate/models/favourite_model.dart';

Future<FavouriteModel> getaddFavourite(
  String pro_id,
) async {
  final response = await http.post(
    Uri.parse("$baseurl/api_addFavourites/"),
    body: jsonEncode(<String, String>{
      "user_id": (await UserData().getUId).toString(),
      "pro_id": pro_id,
    }),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=utf-8',
    },
  );
  if (response.statusCode == 200) {
    Map<String, dynamic> responseJson = json.decode(response.body);
    print('responseJson : $responseJson');
    return FavouriteModel.fromMap(jsonDecode(response.body));
  } else {
    throw Exception('Failed');
  }
}
