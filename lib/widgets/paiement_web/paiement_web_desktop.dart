part of paiement_web_view;

class _PaiementWebDesktop extends StatelessWidget {
  final PaiementWebViewModel viewModel;

  _PaiementWebDesktop(this.viewModel);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('PaiementWebDesktop')),
    );
  }
}