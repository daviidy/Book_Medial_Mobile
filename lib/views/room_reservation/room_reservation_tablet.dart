part of room_reservation_view;

class _RoomReservationTablet extends StatelessWidget {
  final RoomReservationViewModel viewModel;

  _RoomReservationTablet(this.viewModel);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('RoomReservationTablet')),
    );
  }
}