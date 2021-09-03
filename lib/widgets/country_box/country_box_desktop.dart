part of country_box_view;

class _CountryBoxDesktop extends StatelessWidget {
  final CountryBoxViewModel viewModel;

  _CountryBoxDesktop(this.viewModel);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('CountryBoxDesktop')),
    );
  }
}