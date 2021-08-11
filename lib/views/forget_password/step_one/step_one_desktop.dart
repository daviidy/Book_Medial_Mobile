part of step_one_view;

class _StepOneDesktop extends StatelessWidget {
  final StepOneViewModel viewModel;

  _StepOneDesktop(this.viewModel);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('StepOneDesktop')),
    );
  }
}