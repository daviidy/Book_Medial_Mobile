import 'package:book_medial/core/base/base_view_model.dart';
import 'package:book_medial/utils/constant.dart';
import 'package:flutter/widgets.dart';
import 'package:google_maps_webservice/places.dart';

class GoogleSearchBoxViewModel extends BaseViewModel {
  GoogleSearchBoxViewModel();

  PlacesSearchResponse _itemsList = PlacesSearchResponse(status: 'INVALID_REQUEST',results: []);

  final places = GoogleMapsPlaces(apiKey: Constant.kGoogleApiKey);

  BuildContext? _context;

  TextEditingController textController = TextEditingController();

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
    this.itemsList = await places.searchByText(this.textController.text.toLowerCase());
    
  }
  // Add ViewModel specific code here
}
