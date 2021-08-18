import 'dart:convert';

import 'package:book_medial/core/services/database_service.dart';
import 'package:book_medial/utils/constant.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
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

  static Future get({required String endpoint, required String token}) async {
    var client = http.Client();
    Map<String, String> headers = {"Authorization": "Bearer $token"};

    try {
      var uriResponse = await client.get(
          Uri.https(await baseUrl(), "/rs/rsExtranet2" + endpoint),
          headers: headers);
      try {
        return uriResponse;
      } catch (e) {
        return e;
      }
    } finally {
      client.close();
    }
  }

  static Future post({required String endpoint, data, String? token}) async {
    var client = http.Client();
    Map<String, String> headers = {
      "Content-Type": "application/json",
      "Accept": "application/json",
      "Authorization": "Bearer $token",
    };

    try {
      var uriResponse = await client.post(
          Uri.https(await baseUrl(), "/rs/rsExtranet2" + endpoint),
          body: data,
          headers: headers);
      try {
        return uriResponse;
      } catch (e) {
        return e;
      }
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
          Uri.https(await baseUrl(), "/rs/rsExtranet2" + endpoint),
          body: data,
          headers: headers);
      try {
        return uriResponse;
      } catch (e) {
        return e;
      }
    } finally {
      client.close();
    }
  }

  static _queryBuilder(
      String token, String boby, Map param, int startRow, int endRow) async {
    Map _query = {
      "requests": [
        {
          "name": "$boby",
          "params": param,
          "doTotalCount": true,
          "startRowNum": startRow,
          "endRowNum": endRow
        }
      ]
    };

    Response _response = await WsCore.post(
        data: jsonEncode(_query), endpoint: "/boBy/list", token: "$token");

    if (_response.statusCode == 200) {
      Map rpActeList = jsonDecode(utf8.decode(_response.bodyBytes));
      return rpActeList["responses"][0];
    }
    return null;
  }

  static queryBuilderTools(
      {required String token, required String boby, Map? param}) async {
    Map rp = {
      "status": true,
      "message": null,
      "reponse": null,
    };
    List data = [];
    int startRow = 1;
    int endRow = 3000;

    Map? query1 = await _queryBuilder(token, boby, param!, startRow, endRow);
    if (query1 != null) {
      data.addAll(query1['beans']);

      if (query1['totalCount'] == null) query1['totalCount'] = 0;

      while (data.length < query1['totalCount']) {
        startRow = endRow + 1;
        endRow = endRow * 2;

        Map? query2 = await _queryBuilder(token, boby, param, startRow, endRow);
        if (query2 != null) {
          data.addAll(query2['beans']);
        } else {
          rp["status"] = false;
          break;
        }
      }
    } else {
      rp["status"] = false;
    }
    print("########### WSCORE queryBuilderTools : ${data.length}");

    if (rp["status"] || data.length > 0) {
      rp["status"] = true;
      rp["reponse"] = data;
    }
    return rp;
  }

  
}
