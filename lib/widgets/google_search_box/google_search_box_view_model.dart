import 'package:book_medial/core/base/base_view_model.dart';
import 'package:book_medial/utils/constant.dart';
import 'package:flutter/widgets.dart';
import 'package:google_maps_webservice/places.dart';

import 'package:localstorage/localstorage.dart';

class GoogleSearchBoxViewModel extends BaseViewModel {
  GoogleSearchBoxViewModel();

  PlacesSearchResponse _itemsList =
      PlacesSearchResponse(status: 'INVALID_REQUEST', results: []);

  final places = GoogleMapsPlaces(apiKey: Constant.kGoogleApiKey);
  LocalStorage storage = new LocalStorage('book_medial');
  BuildContext? _context;
  String _mevalue = "";
  TextEditingController textController = TextEditingController();

  String get mevalue => this._mevalue;
  set mevalue(String value) {
    this._mevalue = value;
    notifyListeners();
  }

  PlacesSearchResponse get itemsList => this._itemsList;
  set itemsList(PlacesSearchResponse value) {
    this._itemsList = value;
    notifyListeners();
  }

  BuildContext? get context => this._context;
  set context(BuildContext? value) {
    this._context = value;
    notifyListeners();
  }
  // Add ViewModel specific code here

  init(context) async {
    this._context = context;
    this.itemsList = await places.searchByText("");
  }

  Future<void> search() async {
    print(this.textController.text);
    this.itemsList =
        await places.searchByText(this.textController.text.toLowerCase());
  }

  Future<void> setsearch() async {
    print(this.textController.text);
    storage.setItem("medial_val", this.textController.text);
  }

  Future<void> searchVal() async {
    print(this.textController.text);
    this.mevalue = storage.getItem("medial_val");
  }

  // Add ViewModel specific code here
}
