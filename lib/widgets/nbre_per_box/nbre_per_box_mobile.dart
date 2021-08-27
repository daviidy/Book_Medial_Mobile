part of nbre_per_box_view;

class _NbrePerBoxMobile extends StatelessWidget {
  final NbrePerBoxViewModel viewModel;

  _NbrePerBoxMobile(this.viewModel);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('NbrePerBoxMobile')),
    );
  }
}