part of intro_view;

class _IntroDesktop extends StatelessWidget {
  final IntroViewModel viewModel;

  _IntroDesktop(this.viewModel);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text("Cette application n'est pas compatible avec votre appareil",textAlign: TextAlign.center)),
    );
  }
}