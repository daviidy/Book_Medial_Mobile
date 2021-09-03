library country_box_view;

import 'package:book_medial/core/base/base_provider.dart';
import 'package:book_medial/theme/light_color.dart';
import 'package:book_medial/theme/loader.dart';
import 'package:book_medial/theme/theme.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:flutter/material.dart';
import 'country_box_view_model.dart';

part 'country_box_mobile.dart';
part 'country_box_tablet.dart';
part 'country_box_desktop.dart';

class CountryBoxView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    CountryBoxViewModel viewModel = CountryBoxViewModel();
    return ViewModelProvider<CountryBoxViewModel>.withConsumer(
      viewModel: viewModel,
      onModelReady: (viewModel) {
        // Do something once your viewModel is initialized
      },
      builder: (context, viewModel, child) {
        return ScreenTypeLayout(
          mobile: _CountryBoxMobile(viewModel),
          desktop: _CountryBoxDesktop(viewModel),
          tablet: _CountryBoxTablet(viewModel),  
        );
      }
    );
  }
}