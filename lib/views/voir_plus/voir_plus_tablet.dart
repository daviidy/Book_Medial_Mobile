part of voir_plus_view;

class _VoirPlusTablet extends StatelessWidget {
  final VoirPlusViewModel viewModel;

  _VoirPlusTablet(this.viewModel);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('VoirPlusTablet')),
    );
  }
}