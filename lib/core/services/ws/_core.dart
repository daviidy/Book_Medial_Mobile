
import 'package:book_medial/core/services/database_service.dart';
import 'package:book_medial/utils/constant.dart';
import 'package:http/http.dart' as http;
import 'dart:async';

class WsCore {
  // static final String _baseUrl = Constant.baseUrlProd;
  // static final String _baseUrl = Constant.baseUrlRec;

  static final DatabaseService _storage = new DatabaseService();

  static Future<String> baseUrl() async {
    //return Constant.baseUrlRec;
    print("########### WSCORE CONSTRUCTOR");
    var _mode = await _storage.getItem("mode");
    print(_mode);

    if (_mode == "DEV") {
      return Constant.baseUrlPreProd;
    }
    return Constant.baseUrlProd;
  }

  static Future get({required String endpoint, String? token, Map<String, dynamic>? queryParameters}) async {
    var client = http.Client();
    Map<String, String> headers = {"Authorization": "Bearer $token"};

    try {
      var uriResponse = await client.get(
          Uri.https(await baseUrl(), "/api" + endpoint, queryParameters),
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

  static Future post({required String endpoint, data, String? token, Map<String, dynamic>? queryParameters}) async {
    var client = http.Client();
    Map<String, String> headers = {
      "Content-Type": "application/json",
      "Accept": "application/json",
      "Authorization": "Bearer $token",
    };

    try {
      var uriResponse = await client.post(
          Uri.https(await baseUrl(), "/api" + endpoint, queryParameters),
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
          Uri.https(await baseUrl(), "/api" + endpoint),
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
