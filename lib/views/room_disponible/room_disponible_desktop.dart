part of room_disponible_view;

class _RoomDisponibleDesktop extends StatelessWidget {
  final RoomDisponibleViewModel viewModel;

  _RoomDisponibleDesktop(this.viewModel);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('RoomDisponibleDesktop')),
    );
  }
}