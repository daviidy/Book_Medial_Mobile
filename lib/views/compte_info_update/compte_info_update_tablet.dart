part of compte_info_update_view;

class _CompteInfoUpdateTablet extends StatelessWidget {
  final CompteInfoUpdateViewModel viewModel;

  _CompteInfoUpdateTablet(this.viewModel);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('CompteInfoUpdateTablet')),
    );
  }
}