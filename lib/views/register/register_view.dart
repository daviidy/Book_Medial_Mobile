library register_view;

import 'package:auto_size_text/auto_size_text.dart';
import 'package:book_medial/core/base/base_provider.dart';
import 'package:book_medial/theme/light_color.dart';
import 'package:book_medial/theme/loader.dart';
import 'package:book_medial/theme/theme.dart';
import 'package:book_medial/widgets/_share.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:loading_overlay/loading_overlay.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:flutter/material.dart';
import 'register_view_model.dart';

part 'register_mobile.dart';
part 'register_tablet.dart';
part 'register_desktop.dart';

class RegisterView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    RegisterViewModel viewModel = RegisterViewModel();
    return ViewModelProvider<RegisterViewModel>.withConsumer(
        viewModel: viewModel,
        onModelReady: (viewModel) {
          // Do something once your viewModel is initialized
        },
        builder: (context, viewModel, child) {
          return ScreenTypeLayout(
            mobile: _RegisterMobile(viewModel),
            desktop: _RegisterDesktop(viewModel),
            tablet: _RegisterTablet(viewModel),
          );
        });
  }
}
