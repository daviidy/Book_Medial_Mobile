library notify_view;

import 'package:auto_size_text/auto_size_text.dart';
import 'package:book_medial/core/base/base_provider.dart';
import 'package:book_medial/theme/light_color.dart';
import 'package:book_medial/theme/theme.dart';
import 'package:book_medial/widgets/bottom_menu.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:flutter/material.dart';
import 'notify_view_model.dart';

part 'notify_mobile.dart';
part 'notify_tablet.dart';
part 'notify_desktop.dart';

class NotifyView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    NotifyViewModel viewModel = NotifyViewModel();
    return ViewModelProvider<NotifyViewModel>.withConsumer(
      viewModel: viewModel,
      onModelReady: (viewModel) {
        // Do something once your viewModel is initialized
      },
      builder: (context, viewModel, child) {
        return ScreenTypeLayout(
          mobile: _NotifyMobile(viewModel),
          desktop: _NotifyDesktop(viewModel),
          tablet: _NotifyTablet(viewModel),  
        );
      }
    );
  }
}