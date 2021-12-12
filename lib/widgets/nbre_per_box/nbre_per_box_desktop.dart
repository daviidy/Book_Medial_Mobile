part of nbre_per_box_view;

class _NbrePerBoxDesktop extends StatelessWidget {
  final NbrePerBoxViewModel viewModel;

  _NbrePerBoxDesktop(this.viewModel);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('NbrePerBoxDesktop')),
    );
  }
}