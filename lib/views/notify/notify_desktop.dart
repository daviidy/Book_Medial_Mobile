part of notify_view;

class _NotifyDesktop extends StatelessWidget {
  final NotifyViewModel viewModel;

  _NotifyDesktop(this.viewModel);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('NotifyDesktop')),
    );
  }
}