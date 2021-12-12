part of google_search_box_view;

class _GoogleSearchBoxDesktop extends StatelessWidget {
  final GoogleSearchBoxViewModel viewModel;

  _GoogleSearchBoxDesktop(this.viewModel);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('GoogleSearchBoxDesktop')),
    );
  }
}