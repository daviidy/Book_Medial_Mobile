part of notify_view;

class _NotifyTablet extends StatelessWidget {
  final NotifyViewModel viewModel;

  _NotifyTablet(this.viewModel);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('NotifyTablet')),
    );
  }
}