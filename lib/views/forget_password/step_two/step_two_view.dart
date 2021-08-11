library step_two_view;

import 'package:auto_size_text/auto_size_text.dart';
import 'package:book_medial/core/base/base_provider.dart';
import 'package:book_medial/theme/light_color.dart';
import 'package:book_medial/theme/theme.dart';
import 'package:book_medial/widgets/_share.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:flutter/material.dart';
import 'step_two_view_model.dart';

part 'step_two_mobile.dart';
part 'step_two_tablet.dart';
part 'step_two_desktop.dart';

class StepTwoView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    StepTwoViewModel viewModel = StepTwoViewModel();
    return ViewModelProvider<StepTwoViewModel>.withConsumer(
      viewModel: viewModel,
      onModelReady: (viewModel) {
        // Do something once your viewModel is initialized
      },
      builder: (context, viewModel, child) {
        return ScreenTypeLayout(
          mobile: _StepTwoMobile(viewModel),
          desktop: _StepTwoDesktop(viewModel),
          tablet: _StepTwoTablet(viewModel),  
        );
      }
    );
  }
}