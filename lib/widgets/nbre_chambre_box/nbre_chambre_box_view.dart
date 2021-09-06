library nbre_chambre_box_view;

import 'package:auto_size_text/auto_size_text.dart';
import 'package:book_medial/core/base/base_provider.dart';
import 'package:book_medial/theme/light_color.dart';
import 'package:book_medial/theme/theme.dart';
import 'package:book_medial/widgets/_share.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:flutter/material.dart';
import 'nbre_chambre_box_view_model.dart';

part 'nbre_chambre_box_mobile.dart';
part 'nbre_chambre_box_tablet.dart';
part 'nbre_chambre_box_desktop.dart';

class NbreChambreBoxView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    NbreChambreBoxViewModel viewModel = NbreChambreBoxViewModel();
    return ViewModelProvider<NbreChambreBoxViewModel>.withConsumer(
      viewModel: viewModel,
      onModelReady: (viewModel) {
        // Do something once your viewModel is initialized
      },
      builder: (context, viewModel, child) {
        return ScreenTypeLayout(
          mobile: _NbreChambreBoxMobile(viewModel),
          desktop: _NbreChambreBoxDesktop(viewModel),
          tablet: _NbreChambreBoxTablet(viewModel),  
        );
      }
    );
  }
}