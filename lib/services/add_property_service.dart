import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:realestate/constants/baseurl.dart';
import 'package:realestate/constants/userdata.dart';
import 'package:realestate/models/add_property_model.dart';

Future<Addpropertymodel> getAddproperty(
  String pro_type,
  String category,
  String location,
  String area_measure,
  String price,
  String description,
  String contact,
  String image,
) async {
  try {
    var uri = Uri.parse(baseurl + "/api_addProperty/");
    http.Response response;
    final request = http.MultipartRequest(
      'POST',
      uri,
    );
    request.fields['user_id'] = (await UserData().getUId).toString();
    request.fields['pro_type'] = pro_type;
    request.fields['category'] = category;
    request.fields['location'] = location;
    request.fields['area_measure'] = area_measure;
    request.fields['price'] = price;
    request.fields['description'] = description;
    request.fields['contact'] = contact;

//File Array

    File imageSource = (File(image));

    http.MultipartFile files;
// create multipart request

    String fileName = imageSource.path.split("/").last;

    var stream = http.ByteStream(imageSource.openRead());
    stream.cast();

    var length = await imageSource.length();

    files = (http.MultipartFile('img', stream, length, filename: fileName));
    if (kDebugMode) {
      print(fileName);
    }

    request.files.add(files);

    if (kDebugMode) {
      print("Started uploading file ");
    }

    var streamedResponse = await request.send();
    if (kDebugMode) {
      print(streamedResponse.statusCode);
    }
    response = await http.Response.fromStream(streamedResponse);
    final Map<String, dynamic> decoded = jsonDecode(response.body);
    if (response.statusCode == 200) {
      final response = Addpropertymodel.fromMap(decoded);
      return response;
    } else {
      throw Exception('Failed to Upload');
    }
  } on SocketException {
    throw Exception('Server error');
  } on HttpException {
    throw Exception('Something went wrong');
  } on FormatException {
    throw Exception('Bad request');
  } catch (e) {
    throw Exception(e.toString());
  }
}
