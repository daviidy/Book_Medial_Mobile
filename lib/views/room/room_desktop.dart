part of room_view;

class _RoomDesktop extends StatelessWidget {
  final RoomViewModel viewModel;

  _RoomDesktop(this.viewModel);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('RoomDesktop')),
    );
  }
}