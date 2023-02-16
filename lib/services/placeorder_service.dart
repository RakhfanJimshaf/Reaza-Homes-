import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:realestate/constants/baseurl.dart';

import '../constants/userdata.dart';
import '../models/placeorder_model.dart';

Future<Placeordermodel> getplaceorder(int propertyid, String price) async {
  final response = await http.post(
    Uri.parse(baseurl + "/api_orderitem/"),
    body: jsonEncode(<String, String>{
      "user_id": (await UserData().getUId).toString(),
      "property_id": propertyid.toString(),
      "amount": price.toString() 
    }),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=utf-8',
    },
  );
  if (response.statusCode == 200) {
    Map<String, dynamic> responseJson = json.decode(response.body);
    print('responseJson : $responseJson');
    return Placeordermodel.fromMap(jsonDecode(response.body));
  } else {
    throw Exception('Failed');
  }
}
