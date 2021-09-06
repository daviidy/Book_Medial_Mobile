part of country_box_view;

class _CountryBoxTablet extends StatelessWidget {
  final CountryBoxViewModel viewModel;

  _CountryBoxTablet(this.viewModel);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('CountryBoxTablet')),
    );
  }
}