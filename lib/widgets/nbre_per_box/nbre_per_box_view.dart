library nbre_per_box_view;

import 'package:book_medial/core/base/base_provider.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:flutter/material.dart';
import 'nbre_per_box_view_model.dart';

part 'nbre_per_box_mobile.dart';
part 'nbre_per_box_tablet.dart';
part 'nbre_per_box_desktop.dart';

class NbrePerBoxView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    NbrePerBoxViewModel viewModel = NbrePerBoxViewModel();
    return ViewModelProvider<NbrePerBoxViewModel>.withConsumer(
      viewModel: viewModel,
      onModelReady: (viewModel) {
        // Do something once your viewModel is initialized
      },
      builder: (context, viewModel, child) {
        return ScreenTypeLayout(
          mobile: _NbrePerBoxMobile(viewModel),
          desktop: _NbrePerBoxDesktop(viewModel),
          tablet: _NbrePerBoxTablet(viewModel),  
        );
      }
    );
  }
}