part of compte_info_view;

class _CompteInfoDesktop extends StatelessWidget {
  final CompteInfoViewModel viewModel;

  _CompteInfoDesktop(this.viewModel);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('CompteInfoDesktop')),
    );
  }
}