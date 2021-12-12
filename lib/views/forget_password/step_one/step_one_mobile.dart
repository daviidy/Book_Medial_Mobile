part of step_one_view;

class _StepOneMobile extends StatelessWidget {
  final StepOneViewModel viewModel;

  _StepOneMobile(this.viewModel);
  Widget _form(context) {
    return FormBuilder(
        key: viewModel.formKey,
        initialValue: {},
        autovalidateMode: AutovalidateMode.disabled,
        child: Column(
          children: <Widget>[
            ShareWidget.input(
              name: "email",
              labelText: "Adresse mail",
              validators: [
                FormBuilderValidators.required(context,
                    errorText: "Ce champs est requis")
              ],
            ),
          ],
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LoadingOverlay(
        color: Colors.black38,
        progressIndicator: spinkit10,
        isLoading: viewModel.loader,
        child: SingleChildScrollView(
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
                    "Mot de passe",
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
                    "oublié",
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
                    "Entrez l’adresse email associé",
                    maxLines: 1,
                    maxFontSize: 24,
                    minFontSize: 10,
                    style: AppTheme.globalFont(
                        TextStyle(fontSize: 14, fontWeight: FontWeight.w400)),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(left: 20),
                  child: AutoSizeText(
                    "à votre compte",
                    maxLines: 1,
                    maxFontSize: 24,
                    minFontSize: 10,
                    style: AppTheme.globalFont(
                        TextStyle(fontSize: 14, fontWeight: FontWeight.w400)),
                  ),
                ),
                SizedBox(
                  height: AppTheme.fullHeight(context) / 8,
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
                        title: "Envoyer",
                        textColor: Colors.white,
                        height: 50,
                        margin: 0),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  padding: EdgeInsets.only(left: 25),
                  child: AutoSizeText(
                    "Vous recevrez un mot de passe de 4 chiffres",
                    maxLines: 1,
                    maxFontSize: 24,
                    minFontSize: 10,
                    style: AppTheme.globalFont(
                        TextStyle(fontSize: 14, fontWeight: FontWeight.w400)),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(left: 25),
                  child: AutoSizeText(
                    "à cettre adresse",
                    maxLines: 1,
                    maxFontSize: 24,
                    minFontSize: 10,
                    style: AppTheme.globalFont(
                        TextStyle(fontSize: 14, fontWeight: FontWeight.w400)),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
