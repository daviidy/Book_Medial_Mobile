part of notify_reserv_view;

class _NotifyReservMobile extends StatelessWidget {
  final NotifyReservViewModel viewModel;

  _NotifyReservMobile(this.viewModel);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('NotifyReservMobile')),
    );
  }
}