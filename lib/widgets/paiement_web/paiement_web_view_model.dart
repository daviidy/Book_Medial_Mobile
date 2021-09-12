import 'package:book_medial/core/base/base_view_model.dart';
import 'package:book_medial/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

class PaiementWebViewModel extends BaseViewModel {
  PaiementWebViewModel();
  String _url = "";
  String successUrl = "";

  String get url => this._url;
  set url(String value) {
    this._url = value;
    notifyListeners();
  }
  // Add ViewModel specific code here

  init(context) {
    print(url);

    final flutterWebviewPlugin = new FlutterWebviewPlugin();

    flutterWebviewPlugin.onUrlChanged.listen((String url) {
      print("url");
      print(url);

      if (url.contains(this.successUrl)) {
        Navigator.pop(context, "success");
      }

      if (url.contains(Constant.buyEchecUrl)) {
        Navigator.pop(context, "echec");
      }
    });
  }
}
