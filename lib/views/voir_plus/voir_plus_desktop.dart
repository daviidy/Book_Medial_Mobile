part of voir_plus_view;

class _VoirPlusDesktop extends StatelessWidget {
  final VoirPlusViewModel viewModel;

  _VoirPlusDesktop(this.viewModel);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('VoirPlusDesktop')),
    );
  }
}