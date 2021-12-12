library photo_full_view;

import 'dart:io';

import 'package:book_medial/core/base/base_provider.dart';
import 'package:book_medial/theme/light_color.dart';
import 'package:photo_view/photo_view.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:flutter/material.dart';
import 'photo_full_view_model.dart';

part 'photo_full_mobile.dart';
part 'photo_full_tablet.dart';
part 'photo_full_desktop.dart';

class PhotoFullView extends StatefulWidget {
  final String? photoTag;
  final String photoUrl;

  PhotoFullView({this.photoTag, required this.photoUrl});

  @override
  _PhotoFullViewState createState() => _PhotoFullViewState();
}

class _PhotoFullViewState extends State<PhotoFullView> {
  @override
  Widget build(BuildContext context) {
    PhotoFullViewModel viewModel = PhotoFullViewModel();
    return ViewModelProvider<PhotoFullViewModel>.withConsumer(
        viewModel: viewModel,
        onModelReady: (viewModel) {
          viewModel.photoTag = this.widget.photoTag;
          viewModel.photoUrl = this.widget.photoUrl;
          // Do something once your viewModel is initialized
        },
        builder: (context, viewModel, child) {
          return ScreenTypeLayout(
            mobile: _PhotoFullMobile(viewModel),
            desktop: _PhotoFullDesktop(viewModel),
            tablet: _PhotoFullTablet(viewModel),
          );
        });
  }
}
