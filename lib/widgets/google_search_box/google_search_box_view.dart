library google_search_box_view;

import 'package:book_medial/core/base/base_provider.dart';
import 'package:book_medial/theme/light_color.dart';
import 'package:book_medial/theme/theme.dart';
import 'package:book_medial/widgets/_share.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:flutter/material.dart';
import 'google_search_box_view_model.dart';
part 'google_search_box_mobile.dart';
part 'google_search_box_tablet.dart';
part 'google_search_box_desktop.dart';

class GoogleSearchBoxView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    GoogleSearchBoxViewModel viewModel = GoogleSearchBoxViewModel();
    return ViewModelProvider<GoogleSearchBoxViewModel>.withConsumer(
        viewModel: viewModel,
        onModelReady: (viewModel) {
          // Do something once your viewModel is initialized
          viewModel.init(context);
        },
        builder: (context, viewModel, child) {
          return ScreenTypeLayout(
            mobile: _GoogleSearchBoxMobile(viewModel),
            desktop: _GoogleSearchBoxDesktop(viewModel),
            tablet: _GoogleSearchBoxTablet(viewModel),
          );
        });
  }
}
