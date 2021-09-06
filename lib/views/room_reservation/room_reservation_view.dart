library room_reservation_view;

import 'package:auto_size_text/auto_size_text.dart';
import 'package:book_medial/core/base/base_provider.dart';
import 'package:book_medial/theme/light_color.dart';
import 'package:book_medial/theme/theme.dart';
import 'package:book_medial/widgets/_share.dart';
import 'package:book_medial/widgets/bottom_menu.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:flutter/material.dart';
import 'room_reservation_view_model.dart';

part 'room_reservation_mobile.dart';
part 'room_reservation_tablet.dart';
part 'room_reservation_desktop.dart';

class RoomReservationView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    RoomReservationViewModel viewModel = RoomReservationViewModel();
    return ViewModelProvider<RoomReservationViewModel>.withConsumer(
        viewModel: viewModel,
        onModelReady: (viewModel) {
          // Do something once your viewModel is initialized
          viewModel.init(context);
        },
        builder: (context, viewModel, child) {
          return ScreenTypeLayout(
            mobile: _RoomReservationMobile(viewModel),
            desktop: _RoomReservationDesktop(viewModel),
            tablet: _RoomReservationTablet(viewModel),
          );
        });
  }
}
