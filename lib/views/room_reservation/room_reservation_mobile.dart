part of room_reservation_view;

class _RoomReservationMobile extends StatelessWidget {
  final RoomReservationViewModel viewModel;

  _RoomReservationMobile(this.viewModel);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('RoomReservationMobile')),
    );
  }
}