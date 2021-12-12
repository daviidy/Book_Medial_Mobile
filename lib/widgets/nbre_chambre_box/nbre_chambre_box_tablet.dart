part of nbre_chambre_box_view;

class _NbreChambreBoxTablet extends StatelessWidget {
  final NbreChambreBoxViewModel viewModel;

  _NbreChambreBoxTablet(this.viewModel);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('NbreChambreBoxTablet')),
    );
  }
}