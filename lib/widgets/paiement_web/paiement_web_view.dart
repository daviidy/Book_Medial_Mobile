library paiement_web_view;

import 'package:book_medial/core/base/base_provider.dart';
import 'package:book_medial/theme/light_color.dart';
import 'package:book_medial/theme/loader.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:flutter/material.dart';
import 'paiement_web_view_model.dart';

part 'paiement_web_mobile.dart';
part 'paiement_web_tablet.dart';
part 'paiement_web_desktop.dart';

class PaiementWebView extends StatelessWidget {
  String url;
  String succesUrl;
  PaiementWebView({required this.url, required this.succesUrl});
  @override
  Widget build(BuildContext context) {
    PaiementWebViewModel viewModel = PaiementWebViewModel();
    return ViewModelProvider<PaiementWebViewModel>.withConsumer(
        viewModel: viewModel,
        onModelReady: (viewModel) {
          // Do something once your viewModel is initialized
          viewModel.url = this.url;
          viewModel.successUrl = this.succesUrl;
          viewModel.init(context);
        },
        builder: (context, viewModel, child) {
          return ScreenTypeLayout(
            mobile: _PaiementWebMobile(viewModel),
            desktop: _PaiementWebDesktop(viewModel),
            tablet: _PaiementWebTablet(viewModel),
          );
        });
  }
}
