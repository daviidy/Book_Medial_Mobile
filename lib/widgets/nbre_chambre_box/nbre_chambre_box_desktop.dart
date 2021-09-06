part of nbre_chambre_box_view;

class _NbreChambreBoxDesktop extends StatelessWidget {
  final NbreChambreBoxViewModel viewModel;

  _NbreChambreBoxDesktop(this.viewModel);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('NbreChambreBoxDesktop')),
    );
  }
}