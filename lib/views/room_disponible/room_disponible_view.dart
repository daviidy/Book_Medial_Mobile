library room_disponible_view;

import 'package:auto_size_text/auto_size_text.dart';
import 'package:book_medial/core/base/base_provider.dart';
import 'package:book_medial/theme/light_color.dart';
import 'package:book_medial/theme/theme.dart';
import 'package:book_medial/widgets/_share.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:flutter/material.dart';
import 'room_disponible_view_model.dart';

part 'room_disponible_mobile.dart';
part 'room_disponible_tablet.dart';
part 'room_disponible_desktop.dart';

class RoomDisponibleView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    RoomDisponibleViewModel viewModel = RoomDisponibleViewModel();
    return ViewModelProvider<RoomDisponibleViewModel>.withConsumer(
      viewModel: viewModel,
      onModelReady: (viewModel) {
        // Do something once your viewModel is initialized
      },
      builder: (context, viewModel, child) {
        return ScreenTypeLayout(
          mobile: _RoomDisponibleMobile(viewModel),
          desktop: _RoomDisponibleDesktop(viewModel),
          tablet: _RoomDisponibleTablet(viewModel),  
        );
      }
    );
  }
}