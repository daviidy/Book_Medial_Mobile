library compte_view;

import 'dart:io';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:book_medial/core/base/base_provider.dart';
import 'package:book_medial/theme/light_color.dart';
import 'package:book_medial/theme/loader.dart';
import 'package:book_medial/theme/theme.dart';
import 'package:book_medial/widgets/_share.dart';
import 'package:book_medial/widgets/bottom_menu.dart';
import 'package:loading_overlay/loading_overlay.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:flutter/material.dart';
import 'compte_view_model.dart';

part 'compte_mobile.dart';
part 'compte_tablet.dart';
part 'compte_desktop.dart';

class CompteView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    CompteViewModel viewModel = CompteViewModel();
    return ViewModelProvider<CompteViewModel>.withConsumer(
        viewModel: viewModel,
        onModelReady: (viewModel) {
          // Do something once your viewModel is initialized
          viewModel.init();
        },
        builder: (context, viewModel, child) {
          return ScreenTypeLayout(
            mobile: _CompteMobile(viewModel),
            desktop: _CompteDesktop(viewModel),
            tablet: _CompteTablet(viewModel),
          );
        });
  }
}
