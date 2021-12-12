library buy_echec_box_view;

import 'package:book_medial/core/base/base_provider.dart';
import 'package:book_medial/theme/light_color.dart';
import 'package:book_medial/theme/theme.dart';
import 'package:book_medial/widgets/_share.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:flutter/material.dart';
import 'buy_echec_box_view_model.dart';

part 'buy_echec_box_mobile.dart';
part 'buy_echec_box_tablet.dart';
part 'buy_echec_box_desktop.dart';

class BuyEchecBoxView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    BuyEchecBoxViewModel viewModel = BuyEchecBoxViewModel();
    return ViewModelProvider<BuyEchecBoxViewModel>.withConsumer(
      viewModel: viewModel,
      onModelReady: (viewModel) {
        // Do something once your viewModel is initialized
      },
      builder: (context, viewModel, child) {
        return ScreenTypeLayout(
          mobile: _BuyEchecBoxMobile(viewModel),
          desktop: _BuyEchecBoxDesktop(viewModel),
          tablet: _BuyEchecBoxTablet(viewModel),  
        );
      }
    );
  }
}