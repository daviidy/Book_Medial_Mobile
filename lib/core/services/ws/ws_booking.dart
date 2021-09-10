import 'dart:convert';
import 'dart:convert' show utf8;

import 'package:book_medial/core/models/session_models.dart';
import 'package:book_medial/core/services/database_service.dart';
import 'package:book_medial/core/services/ws/_core.dart';
import 'package:book_medial/core/services/ws/ws_auth.dart';
import 'package:http/http.dart';

class WsBooking {
  static final DatabaseService _storage = new DatabaseService();

  static Future<WsResponse> create({data}) async {
    WsResponse rp = new WsResponse();
    // refresh token
    // await WsAuth.refreshSession();

    Response reponse = await WsCore.post(
        endpoint: "/booking",
        data: jsonEncode(data),
        token: await _storage.getItem("token"));
    if (reponse.statusCode == 200) {
      Map reponseData = jsonDecode(utf8.decode(reponse.bodyBytes));
      rp.reponse = reponseData;
      rp.status = true;
    } else {
      Map reponseData = jsonDecode(utf8.decode(reponse.bodyBytes));
      rp.message = reponseData["message"];
      print(reponseData);
    }
    return rp;
  }

  static Future<WsResponse> detail(int id) async {
    WsResponse rp = new WsResponse();
    // refresh token
    await WsAuth.refreshSession();

    Response reponse = await WsCore.get(
        endpoint: "/user/booking/$id", token: await _storage.getItem("token"));
    if (reponse.statusCode == 200) {
      Map reponseData = jsonDecode(utf8.decode(reponse.bodyBytes));
      rp.reponse = reponseData;
      rp.status = true;
    }
    return rp;
  }
}
