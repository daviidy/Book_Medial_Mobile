library notify_reserv_view;

import 'package:auto_size_text/auto_size_text.dart';
import 'package:book_medial/core/base/base_provider.dart';
import 'package:book_medial/theme/light_color.dart';
import 'package:book_medial/theme/theme.dart';
import 'package:book_medial/widgets/_share.dart';
import 'package:book_medial/widgets/bottom_menu.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:flutter/material.dart';
import 'package:skeleton_loader/skeleton_loader.dart';
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
          viewModel.init(context);
        },
        builder: (context, viewModel, child) {
          return ScreenTypeLayout(
            mobile: _NotifyReservMobile(viewModel),
            desktop: _NotifyReservDesktop(viewModel),
            tablet: _NotifyReservTablet(viewModel),
          );
        });
  }
}
