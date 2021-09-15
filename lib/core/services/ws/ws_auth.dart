import 'dart:convert';
import 'dart:convert' show utf8;
import 'dart:io';

import 'package:book_medial/core/models/session_models.dart';
import 'package:book_medial/core/services/database_service.dart';
import 'package:book_medial/core/services/ws/_core.dart';
import 'package:book_medial/utils/constant.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart';

class WsAuth {
  static final DatabaseService _storage = new DatabaseService();
  static GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: [
      'email',
      'https://www.googleapis.com/auth/userinfo.profile',
    ],
  );

  static Future<WsResponse> login({data, bool isRefresh = false}) async {
    WsResponse rp = new WsResponse();

    Response reponse =
        await WsCore.post(data: jsonEncode(data), endpoint: "/login");
    if (reponse.statusCode == 200) {
      Map rpReponse = jsonDecode(utf8.decode(reponse.bodyBytes));
      if (rpReponse["user"]["type"] == "client") {
        await _storage.setItem("token", rpReponse["access_token"]);
        await _storage.setItem("userData", rpReponse["user"]);
        await _storage.setItem("userLogin", data);
        await _storage.setItem("socialLogin", false);
        await _storage.setItem("mode", Constant.env);
        rp.status = true;
      } else {
        rp.message =
            "Cette application ne gère pas les comptes partenaires. Veuillez créer un nouveau compte client pour utiliser l'application";
      }
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
    Response reponse =
        await WsCore.post(data: jsonEncode(data), endpoint: "/password/update");
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
    var isSocial = await _storage.getItem("socialLogin");

    if (userLogin != null) {
      (isSocial == true)
          ? rp = await socialLog(data: userLogin)
          : rp = await login(data: userLogin);
    }
    // print("refreshSession");
    // print(useExtData);
    return rp;
  }

  static Future<WsResponse> update({data}) async {
    WsResponse rp = new WsResponse();

    Response reponse = await WsCore.post(
        data: jsonEncode(data),
        endpoint: "/profile/update",
        token: await _storage.getItem("token"));

    if (reponse.statusCode == 200) {
      Map rpReponse = jsonDecode(utf8.decode(reponse.bodyBytes));
      if (rpReponse["user"]["type"] == "client") {
        await _storage.setItem("token", rpReponse["access_token"]);
        await _storage.setItem("userData", rpReponse["user"]);
        rp.status = true;
      }
    } else {
      Map rpReponse = jsonDecode(utf8.decode(reponse.bodyBytes));
      print(rpReponse);
    }

    return rp;
  }

  static Future<WsResponse> updateImage({data}) async {
    WsResponse rp = new WsResponse();

    StreamedResponse reponse = await WsCore.postFile(
        data: data,
        endpoint: "/profile/update",
        token: await _storage.getItem("token"));
    print(reponse);
    if (reponse.statusCode == 200) {
      rp = await refreshSession();
    }

    return rp;
  }

  /// ***  Auth helper fonction END  ****

  static Future<WsResponse> googleSignIn() async {
    WsResponse rp = new WsResponse();
    try {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      // Obtain the auth details from the request
      if (googleUser != null) {
        final GoogleSignInAuthentication googleAuth =
            await googleUser.authentication;
        print(googleAuth);
        // Create a new credential
        final credential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken,
          idToken: googleAuth.idToken,
        );

        // Once signed in, return the UserCredential
        UserCredential userData =
            await FirebaseAuth.instance.signInWithCredential(credential);
        print(userData);

        return await loginOrRegister(userData);
      }
    } catch (error) {
      print(error);
    }

    return rp;
  }

  static Future<WsResponse> facbookSignIn() async {
    WsResponse rp = new WsResponse();
    try {
      final LoginResult loginResult = await FacebookAuth.instance.login();

      final OAuthCredential facebookAuthCredential =
          FacebookAuthProvider.credential(loginResult.accessToken!.token);
      UserCredential userData = await FirebaseAuth.instance
          .signInWithCredential(facebookAuthCredential);
      print(userData);

      return await loginOrRegister(userData);
    } catch (error) {
      print(error);
    }

    return rp;
  }

  static Future<WsResponse> loginOrRegister(UserCredential userData) async {
    Map _data = {
      "name": userData.user!.displayName,
      "email": userData.user!.email,
      "password": userData.user!.uid,
      "phone": userData.user!.phoneNumber,
    };

    return socialLog(data: _data);
  }

  static Future<WsResponse> socialLog({data}) async {
    WsResponse rp = new WsResponse();

    Response reponse =
        await WsCore.post(data: jsonEncode(data), endpoint: "/social/login");
    if (reponse.statusCode == 200) {
      Map rpReponse = jsonDecode(utf8.decode(reponse.bodyBytes));
      if (rpReponse["user"]["type"] == "client") {
        await _storage.setItem("token", rpReponse["access_token"]);
        await _storage.setItem("userData", rpReponse["user"]);
        await _storage.setItem("userLogin", data);
        await _storage.setItem("socialLogin", true);
        rp.status = true;
      } else {
        rp.message =
            "Cette application ne gère pas les comptes partenaires. Veuillez créer un nouveau compte client pour utiliser l'application";
      }
    }

    return rp;
  }
}
