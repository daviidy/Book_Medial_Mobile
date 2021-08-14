library voir_plus_view;

import 'package:auto_size_text/auto_size_text.dart';
import 'package:book_medial/core/base/base_provider.dart';
import 'package:book_medial/theme/theme.dart';
import 'package:book_medial/widgets/_share.dart';
import 'package:book_medial/widgets/bottom_menu.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:flutter/material.dart';
import 'voir_plus_view_model.dart';

part 'voir_plus_mobile.dart';
part 'voir_plus_tablet.dart';
part 'voir_plus_desktop.dart';

class VoirPlusView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    VoirPlusViewModel viewModel = VoirPlusViewModel();
    return ViewModelProvider<VoirPlusViewModel>.withConsumer(
        viewModel: viewModel,
        onModelReady: (viewModel) {
          // Do something once your viewModel is initialized
          viewModel.init(context);
        },
        builder: (context, viewModel, child) {
          return ScreenTypeLayout(
            mobile: _VoirPlusMobile(viewModel),
            desktop: _VoirPlusDesktop(viewModel),
            tablet: _VoirPlusTablet(viewModel),
          );
        });
  }
}
