part of step_three_view;

class _StepThreeDesktop extends StatelessWidget {
  final StepThreeViewModel viewModel;

  _StepThreeDesktop(this.viewModel);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('StepThreeDesktop')),
    );
  }
}