part of notify_reserv_view;

class _NotifyReservTablet extends StatelessWidget {
  final NotifyReservViewModel viewModel;

  _NotifyReservTablet(this.viewModel);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('NotifyReservTablet')),
    );
  }
}