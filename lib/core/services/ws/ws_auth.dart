import 'dart:convert';
import 'dart:convert' show utf8;
import 'dart:io';

import 'package:book_medial/core/models/session_models.dart';
import 'package:book_medial/core/services/database_service.dart';
import 'package:book_medial/core/services/ws/_core.dart';
import 'package:http/http.dart';

class WsAuth {
  static final DatabaseService _storage = new DatabaseService();

  static Future<WsResponse> login({data, bool isRefresh = false}) async {
    WsResponse rp = new WsResponse();

    Response reponse =
        await WsCore.post(data: jsonEncode(data), endpoint: "/login");
    if (reponse.statusCode == 200) {
      Map rpReponse = jsonDecode(utf8.decode(reponse.bodyBytes));
      await _storage.setItem("token", rpReponse["access_token"]);
      await _storage.setItem("userData", rpReponse["user"]);
      await _storage.setItem("userLogin", data);
      rp.status = true;
    }

    return rp;
  }

  static Future<WsResponse> register({data}) async {
    WsResponse rp = new WsResponse();
    Response reponse =
        await WsCore.post(data: jsonEncode(data), endpoint: "/register");
    if (reponse.statusCode == 200) {
      Map loginData = {
        "email": "${data['email']}",
        "password": "${data['password']}"
      };
      rp = await login(data: loginData);
    }

    return rp;
  }

  static Future<WsResponse> verifMail({data}) async {
    WsResponse rp = new WsResponse();
    Response reponse = await WsCore.post(
        data: jsonEncode(data), endpoint: "/user/reset-password");
    if (reponse.statusCode == 200) {
      Map reponseData = jsonDecode(utf8.decode(reponse.bodyBytes));
      rp.message = reponseData["message"];
      rp.status = true;
    }
    return rp;
  }

  static Future<WsResponse> verifCode(code) async {
    WsResponse rp = new WsResponse();
    Response reponse = await WsCore.get(endpoint: "/password/$code");
    if (reponse.statusCode == 200) {
      Map reponseData = jsonDecode(utf8.decode(reponse.bodyBytes));
      rp.reponse = reponseData;
      rp.status = true;
    }
    return rp;
  }

  static Future<WsResponse> updatePassword({data}) async {
    WsResponse rp = new WsResponse();
    Response reponse = await WsCore.post(
        data: jsonEncode(data), endpoint: "/password/update");
    if (reponse.statusCode == 200) {
      Map reponseData = jsonDecode(utf8.decode(reponse.bodyBytes));
      rp.message = reponseData["message"];
      rp.status = true;
    }
    return rp;
  }

  static Future<WsResponse> refreshSession() async {
    WsResponse rp = new WsResponse();

    var userLogin = await _storage.getItem("userLogin");
    if (userLogin != null) rp = await login(data: userLogin);
    // print("refreshSession");
    // print(useExtData);
    return rp;
  }

  /// ***  Auth helper fonction END  ****
}
