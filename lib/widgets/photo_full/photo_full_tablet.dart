part of photo_full_view;

class _PhotoFullTablet extends StatelessWidget {
  final PhotoFullViewModel viewModel;

  _PhotoFullTablet(this.viewModel);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('PhotoFullTablet')),
    );
  }
}