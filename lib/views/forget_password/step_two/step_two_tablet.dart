part of step_two_view;

class _StepTwoTablet extends StatelessWidget {
  final StepTwoViewModel viewModel;

  _StepTwoTablet(this.viewModel);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('StepTwoTablet')),
    );
  }
}