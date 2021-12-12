part of step_three_view;

class _StepThreeTablet extends StatelessWidget {
  final StepThreeViewModel viewModel;

  _StepThreeTablet(this.viewModel);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('StepThreeTablet')),
    );
  }
}