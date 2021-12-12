part of room_view;

class _RoomTablet extends StatelessWidget {
  final RoomViewModel viewModel;

  _RoomTablet(this.viewModel);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('RoomTablet')),
    );
  }
}