part of room_paiement_view;

class _RoomPaiementTablet extends StatelessWidget {
  final RoomPaiementViewModel viewModel;

  _RoomPaiementTablet(this.viewModel);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('RoomPaiementTablet')),
    );
  }
}