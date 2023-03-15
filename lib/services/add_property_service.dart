import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
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
    String image1,
    String image2,
    String image3,
    String video) async {
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
////////////Video uploading
    if (video.isNotEmpty) {
      File videoSource = (File(video));

      http.MultipartFile videofile;
// create multipart request

      String fileVideo = videoSource.path.split("/").last;

      var videoStream = http.ByteStream(videoSource.openRead());
      videoStream.cast();

      var videolength = await videoSource.length();

      videofile = (http.MultipartFile('video', videoStream, videolength,
          filename: fileVideo));
      if (kDebugMode) {
        print(videofile);
      }

      request.files.add(videofile);
    }

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

    File imageSource1 = (File(image));

    http.MultipartFile files1;
// create multipart request

    String fileName1 = imageSource1.path.split("/").last;

    var stream1 = http.ByteStream(imageSource1.openRead());
    stream.cast();

    var length1 = await imageSource1.length();

    files1 =
        (http.MultipartFile('img1', stream1, length1, filename: fileName1));
    if (kDebugMode) {
      print(fileName);
    }

    request.files.add(files1);

    File imageSource2 = (File(image2));

    http.MultipartFile files2;
// create multipart request

    String fileName2 = imageSource2.path.split("/").last;

    var stream2 = http.ByteStream(imageSource2.openRead());
    stream.cast();

    var length2 = await imageSource2.length();

    files2 =
        (http.MultipartFile('img2', stream2, length2, filename: fileName2));
    if (kDebugMode) {
      print(fileName);
    }

    request.files.add(files2);

    File imageSource3 = (File(image3));

    http.MultipartFile files3;
// create multipart request

    String fileName3 = imageSource3.path.split("/").last;

    var stream3 = http.ByteStream(imageSource3.openRead());
    stream.cast();

    var length3 = await imageSource3.length();

    files3 =
        (http.MultipartFile('img3', stream3, length3, filename: fileName3));
    if (kDebugMode) {
      print(fileName);
    }

    request.files.add(files3);
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

ImagUpload(String image, MultipartRequest request) async {
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
}
