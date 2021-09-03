import 'package:book_medial/core/base/base_country.dart';
import 'package:book_medial/core/base/base_view_model.dart';
import 'package:book_medial/core/models/country_models.dart';
import 'package:flutter/material.dart';

class CountryBoxViewModel extends BaseViewModel {
  CountryBoxViewModel();

  BuildContext? _context;
  List<Country> countryListBase = CountryList.fromJson(COUNTRY_DATA_BASE).countries;
  List<Country> _countryList = CountryList.fromJson(COUNTRY_DATA_BASE).countries;

  TextEditingController textController = TextEditingController();

  BuildContext? get context => this._context;
  set context(BuildContext? value) {
    this._context = value;
    notifyListeners();
  }

  List<Country> get countryList => this._countryList;
  set countryList(List<Country> value) {
    this._countryList = value;
    notifyListeners();
  }
  // Add ViewModel specific code here

  Future<void> search() async {
    print(this.textController.text);
    this.countryList = countryListBase
        .where((i) => i.name
            .toLowerCase()
            .contains(this.textController.text.toLowerCase()))
        .toList();
  }
}
