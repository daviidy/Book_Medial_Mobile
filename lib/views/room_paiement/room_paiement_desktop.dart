part of room_paiement_view;

class _RoomPaiementDesktop extends StatelessWidget {
  final RoomPaiementViewModel viewModel;

  _RoomPaiementDesktop(this.viewModel);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('RoomPaiementDesktop')),
    );
  }
}