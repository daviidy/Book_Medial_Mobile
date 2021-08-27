part of google_search_box_view;

class _GoogleSearchBoxTablet extends StatelessWidget {
  final GoogleSearchBoxViewModel viewModel;

  _GoogleSearchBoxTablet(this.viewModel);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('GoogleSearchBoxTablet')),
    );
  }
}