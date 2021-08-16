library notify_reserv_view;

import 'package:book_medial/core/base/base_provider.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:flutter/material.dart';
import 'notify_reserv_view_model.dart';

part 'notify_reserv_mobile.dart';
part 'notify_reserv_tablet.dart';
part 'notify_reserv_desktop.dart';

class NotifyReservView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    NotifyReservViewModel viewModel = NotifyReservViewModel();
    return ViewModelProvider<NotifyReservViewModel>.withConsumer(
      viewModel: viewModel,
      onModelReady: (viewModel) {
        // Do something once your viewModel is initialized
      },
      builder: (context, viewModel, child) {
        return ScreenTypeLayout(
          mobile: _NotifyReservMobile(viewModel),
          desktop: _NotifyReservDesktop(viewModel),
          tablet: _NotifyReservTablet(viewModel),  
        );
      }
    );
  }
}