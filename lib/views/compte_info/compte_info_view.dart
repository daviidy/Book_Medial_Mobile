library compte_info_view;

import 'package:auto_size_text/auto_size_text.dart';
import 'package:book_medial/core/base/base_provider.dart';
import 'package:book_medial/theme/light_color.dart';
import 'package:book_medial/theme/theme.dart';
import 'package:book_medial/widgets/_share.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:flutter/material.dart';
import 'compte_info_view_model.dart';

part 'compte_info_mobile.dart';
part 'compte_info_tablet.dart';
part 'compte_info_desktop.dart';

class CompteInfoView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    CompteInfoViewModel viewModel = CompteInfoViewModel();
    return ViewModelProvider<CompteInfoViewModel>.withConsumer(
        viewModel: viewModel,
        onModelReady: (viewModel) {
          // Do something once your viewModel is initialized
          viewModel.init();
        },
        builder: (context, viewModel, child) {
          return ScreenTypeLayout(
            mobile: _CompteInfoMobile(viewModel),
            desktop: _CompteInfoDesktop(viewModel),
            tablet: _CompteInfoTablet(viewModel),
          );
        });
  }
}
