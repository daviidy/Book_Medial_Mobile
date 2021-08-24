import 'dart:convert';
import 'dart:convert' show utf8;
import 'dart:io';

import 'package:book_medial/core/models/session_models.dart';
import 'package:book_medial/core/services/database_service.dart';
import 'package:book_medial/core/services/ws/_core.dart';
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
    if (userLogin != null) rp = await login(data: userLogin);
    // print("refreshSession");
    // print(useExtData);
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
    WsResponse rp = new WsResponse();
    
    Map _loginData = {
      "email": userData.user!.email,
      "password": userData.user!.uid
    };

    rp = await login(data: _loginData);
    if (!rp.status) {
      Map _registerData = {
        "name": userData.user!.displayName,
        "email": userData.user!.email,
        "password": userData.user!.uid,
        "phone": userData.user!.phoneNumber,
      };
      rp = await register(data: _registerData);
    }

    return rp;
  }
}
