import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:realestate/constants/baseurl.dart';
import 'package:realestate/constants/userdata.dart';
import 'package:realestate/models/view_property_model.dart';

Future<Viewpropertymodel> getViewproperty() async {
  var url = baseurl + "/api_getAllproperty/";
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
    Map<String, dynamic> responseJson = json.decode(res.body);
    print('responseJson : $responseJson');

    return Viewpropertymodel.fromMap(jsonDecode(res.body));
  } else {
    throw Exception('Failed');
  }
}
