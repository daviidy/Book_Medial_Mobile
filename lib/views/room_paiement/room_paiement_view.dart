library room_paiement_view;

import 'package:auto_size_text/auto_size_text.dart';
import 'package:book_medial/core/base/base_provider.dart';
import 'package:book_medial/core/models/session_models.dart';
import 'package:book_medial/theme/light_color.dart';
import 'package:book_medial/theme/theme.dart';
import 'package:book_medial/utils/shared.dart';
import 'package:book_medial/widgets/_share.dart';
import 'package:intl/intl.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:flutter/material.dart';
import 'room_paiement_view_model.dart';

part 'room_paiement_mobile.dart';
part 'room_paiement_tablet.dart';
part 'room_paiement_desktop.dart';

class RoomPaiementView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    RoomPaiementViewModel viewModel = RoomPaiementViewModel();
    return ViewModelProvider<RoomPaiementViewModel>.withConsumer(
        viewModel: viewModel,
        onModelReady: (viewModel) {
          // Do something once your viewModel is initialized
          viewModel.init(context);
        },
        builder: (context, viewModel, child) {
          return ScreenTypeLayout(
            mobile: _RoomPaiementMobile(viewModel),
            desktop: _RoomPaiementDesktop(viewModel),
            tablet: _RoomPaiementTablet(viewModel),
          );
        });
  }
}
