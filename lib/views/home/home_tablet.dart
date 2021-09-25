part of home_view;

class _HomeTablet extends StatelessWidget {
  final HomeViewModel viewModel;

  _HomeTablet(this.viewModel);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text("Cette application n'est pas compatible avec votre appareil",textAlign: TextAlign.center))
    );
  }
}
