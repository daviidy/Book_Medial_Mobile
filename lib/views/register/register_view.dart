library register_view;

import 'package:book_medial/core/base/base_provider.dart';
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
