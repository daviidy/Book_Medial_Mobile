library compte_info_update_view;

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
import 'compte_info_update_view_model.dart';

part 'compte_info_update_mobile.dart';
part 'compte_info_update_tablet.dart';
part 'compte_info_update_desktop.dart';

class CompteInfoUpdateView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    CompteInfoUpdateViewModel viewModel = CompteInfoUpdateViewModel();
    return ViewModelProvider<CompteInfoUpdateViewModel>.withConsumer(
        viewModel: viewModel,
        onModelReady: (viewModel) {
          // Do something once your viewModel is initialized
          viewModel.init(context);
        },
        builder: (context, viewModel, child) {
          return ScreenTypeLayout(
            mobile: _CompteInfoUpdateMobile(viewModel),
            desktop: _CompteInfoUpdateDesktop(viewModel),
            tablet: _CompteInfoUpdateTablet(viewModel),
          );
        });
  }
}
