part of compte_info_view;

class _CompteInfoTablet extends StatelessWidget {
  final CompteInfoViewModel viewModel;

  _CompteInfoTablet(this.viewModel);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('CompteInfoTablet')),
    );
  }
}