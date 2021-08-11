part of step_three_view;

class _StepThreeMobile extends StatelessWidget {
  final StepThreeViewModel viewModel;

  _StepThreeMobile(this.viewModel);

  Widget _form(context) {
    return FormBuilder(
        key: viewModel.formKey,
        initialValue: {},
        autovalidateMode: AutovalidateMode.disabled,
        child: Column(
          children: <Widget>[
            ShareWidget.input(
              name: "passwd",
              labelText: "Mot de passe",
              validators: [
                FormBuilderValidators.required(context,
                    errorText: "Ce champs est requis")
              ],
              obscureText: viewModel.obscureMp,
              suffixIcon: GestureDetector(
                  onTap: () => viewModel.obscureMp = !viewModel.obscureMp,
                  child: Image.asset("assets/icons/eye.png")),
            ),
            SizedBox(
              height: 10,
            ),
            ShareWidget.input(
                name: "conf_passwd",
                labelText: "Confirmer Mot de passe",
                validators: [
                  FormBuilderValidators.required(context,
                      errorText: "Ce champs est requis")
                ],
                suffixIcon: GestureDetector(
                    onTap: () => viewModel.obscureCmp = !viewModel.obscureCmp,
                    child: Image.asset("assets/icons/eye.png")),
                obscureText: viewModel.obscureCmp),
          ],
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 20,
              ),
              ShareWidget.headerStyle2(context: context),
              SizedBox(
                height: 20,
              ),
              Container(
                padding: EdgeInsets.only(left: 20),
                child: AutoSizeText(
                  "Nouveau",
                  maxLines: 1,
                  maxFontSize: 24,
                  minFontSize: 10,
                  style: AppTheme.globalFont(
                      TextStyle(fontSize: 24, fontWeight: FontWeight.w700)),
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 20),
                child: AutoSizeText(
                  "mot de passe",
                  maxLines: 1,
                  maxFontSize: 24,
                  minFontSize: 10,
                  style: AppTheme.globalFont(
                      TextStyle(fontSize: 24, fontWeight: FontWeight.w700)),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                padding: EdgeInsets.only(left: 20),
                child: AutoSizeText(
                  "Entrez le code de 4 chiffres reçu par mail",
                  maxLines: 1,
                  maxFontSize: 24,
                  minFontSize: 10,
                  style: AppTheme.globalFont(
                      TextStyle(fontSize: 14, fontWeight: FontWeight.w400)),
                ),
              ),
              
              SizedBox(
                height: AppTheme.fullHeight(context) / 6,
              ),
              Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: _form(context)),
              SizedBox(
                height: 10,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 14),
                child: TextButton(
                  onPressed: () => viewModel.send(context),
                  child: ShareWidget.button(
                      context: context,
                      backgoundColor: LightColor.primary,
                      borderWidth: 0.0,
                      title: "Confirmer",
                      textColor: Colors.white,
                      height: 50,
                      margin: 0),
                ),
              ),
              
            ],
          ),
        ),
      ),
    );
  }
}
