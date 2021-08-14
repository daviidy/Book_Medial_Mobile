part of compte_view;

class _CompteTablet extends StatelessWidget {
  final CompteViewModel viewModel;

  _CompteTablet(this.viewModel);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('CompteTablet')),
    );
  }
}