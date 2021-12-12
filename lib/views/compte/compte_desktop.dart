part of compte_view;

class _CompteDesktop extends StatelessWidget {
  final CompteViewModel viewModel;

  _CompteDesktop(this.viewModel);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('CompteDesktop')),
    );
  }
}