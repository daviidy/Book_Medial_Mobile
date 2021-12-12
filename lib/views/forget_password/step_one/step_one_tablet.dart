part of step_one_view;

class _StepOneTablet extends StatelessWidget {
  final StepOneViewModel viewModel;

  _StepOneTablet(this.viewModel);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('StepOneTablet')),
    );
  }
}