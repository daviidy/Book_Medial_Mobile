library step_one_view;

import 'package:auto_size_text/auto_size_text.dart';
import 'package:book_medial/core/base/base_provider.dart';
import 'package:book_medial/theme/light_color.dart';
import 'package:book_medial/theme/theme.dart';
import 'package:book_medial/widgets/_share.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:flutter/material.dart';
import 'step_one_view_model.dart';

part 'step_one_mobile.dart';
part 'step_one_tablet.dart';
part 'step_one_desktop.dart';

class StepOneView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    StepOneViewModel viewModel = StepOneViewModel();
    return ViewModelProvider<StepOneViewModel>.withConsumer(
      viewModel: viewModel,
      onModelReady: (viewModel) {
        // Do something once your viewModel is initialized
      },
      builder: (context, viewModel, child) {
        return ScreenTypeLayout(
          mobile: _StepOneMobile(viewModel),
          desktop: _StepOneDesktop(viewModel),
          tablet: _StepOneTablet(viewModel),  
        );
      }
    );
  }
}