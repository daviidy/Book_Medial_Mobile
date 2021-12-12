part of compte_info_update_view;

class _CompteInfoUpdateDesktop extends StatelessWidget {
  final CompteInfoUpdateViewModel viewModel;

  _CompteInfoUpdateDesktop(this.viewModel);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('CompteInfoUpdateDesktop')),
    );
  }
}