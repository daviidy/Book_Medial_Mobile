import 'dart:convert';
import 'dart:convert' show utf8;
import 'dart:io';

import 'package:book_medial/core/models/session_models.dart';
import 'package:book_medial/core/services/database_service.dart';
import 'package:book_medial/core/services/ws/_core.dart';
import 'package:book_medial/core/services/ws/ws_auth.dart';
import 'package:http/http.dart';

class WsProperty {
  static final DatabaseService _storage = new DatabaseService();

  static Future<WsResponse> popular() async {
    WsResponse rp = new WsResponse();
    // refresh token
    await WsAuth.refreshSession();

    Response reponse = await WsCore.get(
        endpoint: "/properties/popular",
        token: await _storage.getItem("token"));
    if (reponse.statusCode == 200) {
      Map reponseData = jsonDecode(utf8.decode(reponse.bodyBytes));
      rp.reponse = reponseData;
      rp.status = true;
    }
    return rp;
  }

  static Future<WsResponse> last() async {
    WsResponse rp = new WsResponse();
    // refresh token
    await WsAuth.refreshSession();

    Response reponse = await WsCore.get(
        endpoint: "/properties", token: await _storage.getItem("token"));
    if (reponse.statusCode == 200) {
      Map reponseData = jsonDecode(utf8.decode(reponse.bodyBytes));
      rp.reponse = reponseData;
      rp.status = true;
    }
    return rp;
  }

  static Future<WsResponse> byCity(city) async {
    WsResponse rp = new WsResponse();
    // refresh token
    await WsAuth.refreshSession();

    Response reponse = await WsCore.get(
        endpoint: "/properties/city/$city",
        token: await _storage.getItem("token"));
    if (reponse.statusCode == 200) {
      Map reponseData = jsonDecode(utf8.decode(reponse.bodyBytes));
      rp.reponse = reponseData;
      rp.status = true;
    }
    return rp;
  }
}
