part of room_disponible_view;

class _RoomDisponibleTablet extends StatelessWidget {
  final RoomDisponibleViewModel viewModel;

  _RoomDisponibleTablet(this.viewModel);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('RoomDisponibleTablet')),
    );
  }
}