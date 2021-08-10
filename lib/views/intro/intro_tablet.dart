part of intro_view;

class _IntroTablet extends StatelessWidget {
  final IntroViewModel viewModel;

  _IntroTablet(this.viewModel);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('IntroTablet')),
    );
  }
}