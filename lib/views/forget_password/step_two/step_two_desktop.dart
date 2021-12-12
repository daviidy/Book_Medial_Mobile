part of step_two_view;

class _StepTwoDesktop extends StatelessWidget {
  final StepTwoViewModel viewModel;

  _StepTwoDesktop(this.viewModel);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('StepTwoDesktop')),
    );
  }
}