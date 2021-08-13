part of room_reservation_view;

class _RoomReservationDesktop extends StatelessWidget {
  final RoomReservationViewModel viewModel;

  _RoomReservationDesktop(this.viewModel);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('RoomReservationDesktop')),
    );
  }
}