part of paiement_web_view;

class _PaiementWebTablet extends StatelessWidget {
  final PaiementWebViewModel viewModel;

  _PaiementWebTablet(this.viewModel);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('PaiementWebTablet')),
    );
  }
}