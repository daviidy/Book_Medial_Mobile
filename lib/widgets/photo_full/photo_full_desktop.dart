part of photo_full_view;

class _PhotoFullDesktop extends StatelessWidget {
  final PhotoFullViewModel viewModel;

  _PhotoFullDesktop(this.viewModel);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('PhotoFullDesktop')),
    );
  }
}