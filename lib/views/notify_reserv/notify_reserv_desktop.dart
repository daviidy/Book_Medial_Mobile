part of notify_reserv_view;

class _NotifyReservDesktop extends StatelessWidget {
  final NotifyReservViewModel viewModel;

  _NotifyReservDesktop(this.viewModel);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('NotifyReservDesktop')),
    );
  }
}