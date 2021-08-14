library room_view;

import 'package:auto_size_text/auto_size_text.dart';
import 'package:book_medial/core/base/base_provider.dart';
import 'package:book_medial/theme/light_color.dart';
import 'package:book_medial/theme/theme.dart';
import 'package:book_medial/widgets/_share.dart';
import 'package:book_medial/widgets/bottom_menu.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:flutter/material.dart';
import 'room_view_model.dart';

part 'room_mobile.dart';
part 'room_tablet.dart';
part 'room_desktop.dart';

class RoomView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    RoomViewModel viewModel = RoomViewModel();
    return ViewModelProvider<RoomViewModel>.withConsumer(
      viewModel: viewModel,
      onModelReady: (viewModel) {
        // Do something once your viewModel is initialized
      },
      builder: (context, viewModel, child) {
        return ScreenTypeLayout(
          mobile: _RoomMobile(viewModel),
          desktop: _RoomDesktop(viewModel),
          tablet: _RoomTablet(viewModel),  
        );
      }
    );
  }
}