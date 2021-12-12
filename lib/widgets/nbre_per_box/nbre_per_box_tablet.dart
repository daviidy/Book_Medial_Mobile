part of nbre_per_box_view;

class _NbrePerBoxTablet extends StatelessWidget {
  final NbrePerBoxViewModel viewModel;

  _NbrePerBoxTablet(this.viewModel);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('NbrePerBoxTablet')),
    );
  }
}