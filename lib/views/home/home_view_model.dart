import 'package:book_medial/core/base/base_view_model.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class HomeViewModel extends BaseViewModel {
  int _counter;

  final GlobalKey<FormBuilderState> searchFormKey =
      GlobalKey<FormBuilderState>();

  HomeViewModel({int counter = 0}) : this._counter = counter;

  int get counter => this._counter;
  set counter(int value) {
    this._counter = value;
    notifyListeners();
  }

  void increment() => this.counter += 1;
}