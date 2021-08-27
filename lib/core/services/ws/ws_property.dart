import 'dart:convert';
import 'dart:convert' show utf8;

import 'package:book_medial/core/models/propertie_models.dart';
import 'package:book_medial/core/models/session_models.dart';
import 'package:book_medial/core/services/database_service.dart';
import 'package:book_medial/core/services/ws/_core.dart';
import 'package:book_medial/core/services/ws/ws_auth.dart';
import 'package:http/http.dart';
import 'package:intl/intl.dart';

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

  static Future<WsResponse> search({required SearchPropertyParam data,Map<String, dynamic>? queryParameters}) async {
    WsResponse rp = new WsResponse();
    SearchPropertyParam searchData =
        new SearchPropertyParam.fromJson(data.toJson());
    if (searchData.sejourStart != null)
      searchData.sejourStart = DateFormat('dd/MM/yyyy')
          .format(DateTime.parse(searchData.sejourStart as String));

    if (searchData.sejourEnd != null)
      searchData.sejourEnd = DateFormat('dd/MM/yyyy')
          .format(DateTime.parse(searchData.sejourEnd as String));

    print(searchData.toJson());

    Response reponse = await WsCore.post(
        data: jsonEncode(searchData.toJson()),
        endpoint: "/properties/search",
        token: await _storage.getItem("token"),
        queryParameters:queryParameters);
        
    if (reponse.statusCode == 200) {
      Map reponseData = jsonDecode(utf8.decode(reponse.bodyBytes));
      rp.reponse = reponseData;
      rp.status = true;
    } else {
      print(reponse.statusCode);
    }

    return rp;
  }
}
