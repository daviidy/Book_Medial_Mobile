part of buy_echec_box_view;

class _BuyEchecBoxDesktop extends StatelessWidget {
  final BuyEchecBoxViewModel viewModel;

  _BuyEchecBoxDesktop(this.viewModel);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('BuyEchecBoxDesktop')),
    );
  }
}