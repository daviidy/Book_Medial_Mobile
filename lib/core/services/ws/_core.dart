import 'dart:io';

import 'package:book_medial/utils/constant.dart';
import 'package:http/http.dart' as http;
import 'dart:async';

class WsCore {
  // static final String _baseUrl = Constant.baseUrlProd;
  // static final String _baseUrl = Constant.baseUrlRec;


  static String baseUrl() {
    //return Constant.baseUrlRec;
    print("########### WSCORE CONSTRUCTOR");
    var _mode = Constant.env;
    print(_mode);

    if (_mode == "PROD") {
      return Constant.baseUrlProd;
    }
    return Constant.baseUrlPreProd;
  }

  static Future get(
      {required String endpoint,
      String? token,
      Map<String, dynamic>? queryParameters}) async {
    var client = http.Client();
    Map<String, String> headers = {"Authorization": "Bearer $token"};

    try {
      var uriResponse = await client.get(
          Uri.https(baseUrl(), "/api" + endpoint, queryParameters),
          headers: headers);
      // try {
      //   return uriResponse;
      // } catch (e) {
      //   return e;
      // }
      return uriResponse;
    } finally {
      client.close();
    }
  }

  static Future post(
      {required String endpoint,
      data,
      String? token,
      Map<String, dynamic>? queryParameters}) async {
    var client = http.Client();
    Map<String, String> headers = {
      "Content-Type": "application/json",
      "Accept": "application/json",
      "Authorization": "Bearer $token",
    };

    try {
      var uriResponse = await client.post(
          Uri.https(baseUrl(), "/api" + endpoint, queryParameters),
          body: data,
          headers: headers);
      // try {
      //   return uriResponse;
      // } catch (e) {
      //   return e;
      // }
      return uriResponse;
    } finally {
      client.close();
    }
  }

  static Future postFile(
      {required String endpoint,
      data,
      String? token,
      Map<String, dynamic>? queryParameters}) async {
    // var client = http.Client();

    // Map<String, String> headers = {
    //   "Content-Type": "application/json",
    //   "Accept": "application/json",
    //   "Authorization": "Bearer $token",
    // };

    try {
      var request = http.MultipartRequest('POST',
          Uri.https(baseUrl(), "/api" + endpoint, queryParameters));

      request.files.add(http.MultipartFile(
          'image',
          File(data["image"]).readAsBytes().asStream(),
          File(data["image"]).lengthSync(),
          filename: data["image"].split("/").last));
      
      request.fields["name"] = data["name"];
      request.headers["Authorization"] = "Bearer $token";

      var uriResponse = await request.send();

      return uriResponse;
    } finally {
      // client.close();
    }
  }

  static Future put(
      {required String endpoint, data, required String token}) async {
    var client = http.Client();
    Map<String, String> headers = {
      "Content-Type": "application/json",
      "Accept": "application/json",
      "Authorization": "Bearer $token",
    };

    try {
      var uriResponse = await client.put(
          Uri.https(baseUrl(), "/api" + endpoint),
          body: data,
          headers: headers);
      // try {
      //   return uriResponse;
      // } catch (e) {
      //   return e;
      // }
      return uriResponse;
    } finally {
      client.close();
    }
  }
}
