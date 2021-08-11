part of register_view;

class _RegisterMobile extends StatelessWidget {
  final RegisterViewModel viewModel;

  _RegisterMobile(this.viewModel);
  Widget _registerForm(context) {
    return FormBuilder(
        key: viewModel.registerFormKey,
        initialValue: {},
        autovalidateMode: AutovalidateMode.disabled,
        child: Column(
          children: <Widget>[
            ShareWidget.input(
              name: "name",
              labelText: "Nom",
              validators: [
                FormBuilderValidators.required(context,
                    errorText: "Ce champs est requis")
              ],
            ),
            SizedBox(
              height: 10,
            ),
            ShareWidget.input(
              name: "user_name",
              labelText: "Nom utilisateur",
              validators: [
                FormBuilderValidators.required(context,
                    errorText: "Ce champs est requis")
              ],
            ),
            SizedBox(
              height: 10,
            ),
            ShareWidget.input(
              name: "email",
              labelText: "Email",
              validators: [
                FormBuilderValidators.required(context,
                    errorText: "Ce champs est requis")
              ],
            ),
            SizedBox(
              height: 10,
            ),
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
            SizedBox(
              height: 10,
            ),
            FormBuilderCheckbox(
              name: 'accept_terms',
              checkColor: LightColor.background,
              activeColor: LightColor.primary,
              initialValue: false,
              //onChanged: _onChanged,
              title: AutoSizeText.rich(
                TextSpan(
                  style: AppTheme.globalFont(
                      TextStyle(color: Colors.black, fontSize: 12)),
                  children: [
                    TextSpan(
                      text:
                          "La création de compte signifie que vous acceptez nos ",
                    ),
                    TextSpan(
                      text:
                          "Conditions d'utilisation, Notre politique de confidentialités ",
                      style: TextStyle(fontWeight: FontWeight.w700),
                    ),
                    TextSpan(
                      text: "et nos paramètres de ",
                    ),
                    TextSpan(
                      text: "notification par défaut",
                      style: TextStyle(fontWeight: FontWeight.w700),
                    ),
                  ],
                ),
              ),
              validator: FormBuilderValidators.equal(
                context,
                true,
                errorText: 'You must accept terms and conditions to continue',
              ),
            ),
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
              ShareWidget.headerStyle1(
                  context: context,
                  //route: "/login",
                  text1: "Déjà inscrit ? ",
                  text2: "Connectez-vous"),
              SizedBox(
                height: 20,
              ),
              Container(
                padding: EdgeInsets.only(left: 20),
                child: AutoSizeText(
                  "Inscrivez-vous à",
                  maxLines: 1,
                  maxFontSize: 24,
                  minFontSize: 10,
                  style: AppTheme.globalFont(
                      TextStyle(fontSize: 24, fontWeight: FontWeight.w700)),
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 20),
                child: AutoSizeText.rich(TextSpan(
                    style: AppTheme.globalFont(
                        TextStyle(fontSize: 24, fontWeight: FontWeight.w700)),
                    children: [
                      TextSpan(
                          text: "Book ",
                          style: TextStyle(
                            color: LightColor.primary,
                          )),
                      TextSpan(
                          text: "Médial",
                          style: TextStyle(
                            color: LightColor.second,
                          ))
                    ])),
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                padding: EdgeInsets.only(left: 20),
                child: AutoSizeText(
                  "Je suis un",
                  maxLines: 1,
                  maxFontSize: 24,
                  minFontSize: 10,
                  style: AppTheme.globalFont(
                      TextStyle(fontSize: 18, fontWeight: FontWeight.w700)),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Container(
                padding: EdgeInsets.only(left: 20, right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      flex: 1,
                      child: GestureDetector(
                        onTap: () => viewModel.choseUserType("Client"),
                        child: ShareWidget.buttonIcone(
                          context: context,
                          height: 50,
                          body: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: 15,
                              ),
                              Stack(children: [
                                Align(
                                    alignment: Alignment.center,
                                    child: Image.asset(
                                        "assets/icons/select-inactif.png")),
                                if (viewModel.isClient)
                                  Positioned(
                                      bottom: 16,
                                      left: 5,
                                      child: Image.asset(
                                          "assets/icons/select-actif.png")),
                              ]),
                              SizedBox(
                                width: 20,
                              ),
                              AutoSizeText(
                                "Client",
                                style: AppTheme.globalFont(TextStyle(
                                  fontSize: 14,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w700,
                                )),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                          textColor: Colors.black,
                          borderColor: Color(0xffA3A3A3),
                          borderWidth: 1.0,
                        ),
                      ),
                    ),
                    Container(
                      width: 30,
                    ),
                    Expanded(
                      flex: 1,
                      child: GestureDetector(
                        onTap: () => viewModel.choseUserType("Hotel"),
                        child: ShareWidget.buttonIcone(
                          context: context,
                          height: 50,
                          body: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: 15,
                              ),
                              Stack(children: [
                                Align(
                                    alignment: Alignment.center,
                                    child: Image.asset(
                                        "assets/icons/select-inactif.png")),
                                if (!viewModel.isClient)
                                  Positioned(
                                      bottom: 16,
                                      left: 5,
                                      child: Image.asset(
                                          "assets/icons/select-actif.png")),
                              ]),
                              SizedBox(
                                width: 20,
                              ),
                              AutoSizeText(
                                "Hotel",
                                style: AppTheme.globalFont(TextStyle(
                                  fontSize: 14,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w700,
                                )),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                          textColor: Colors.black,
                          borderColor: Color(0xffA3A3A3),
                          borderWidth: 1.0,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                padding: EdgeInsets.only(left: 20, right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      flex: 5,
                      child: ShareWidget.buttonIcone(
                        context: context,
                        height: 50,
                        body: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset("assets/icons/google.png"),
                            SizedBox(
                              width: 5,
                            ),
                            AutoSizeText(
                              "Inscrivez-vous avec Gooogle",
                              style: AppTheme.globalFont(TextStyle(
                                fontSize: 14,
                                color: Colors.black,
                                fontWeight: FontWeight.w700,
                              )),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                        textColor: Colors.black,
                        borderColor: Color(0xffA3A3A3),
                        borderWidth: 1.0,
                      ),
                    ),
                    Container(
                      width: 20,
                    ),
                    Expanded(
                      flex: 1,
                      child: ShareWidget.buttonIcone(
                          context: context,
                          height: 50,
                          body: Image.asset("assets/icons/facebook.png"),
                          textColor: Colors.black,
                          borderColor: Color(0xffA3A3A3),
                          borderWidth: 1.0,
                          padding: EdgeInsets.only(left: 15, right: 15)),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                child: Row(
                  children: [
                    Expanded(
                      child: Divider(
                        color: Color(0xffE4E4E4),
                        height: 20,
                        thickness: 1,
                        indent: 20,
                        endIndent: 20,
                      ),
                    ),
                    AutoSizeText(
                      "Ou",
                      style: AppTheme.globalFont(TextStyle(
                        fontSize: 14,
                        color: Colors.black,
                      )),
                      textAlign: TextAlign.center,
                    ),
                    Expanded(
                      child: Divider(
                        color: Color(0xffE4E4E4),
                        height: 20,
                        thickness: 1,
                        indent: 20,
                        endIndent: 20,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: _registerForm(context)),
              SizedBox(
                height: 10,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 14),
                child: TextButton(
                  onPressed: () => viewModel.register(context),
                  child: ShareWidget.button(
                      context: context,
                      backgoundColor: LightColor.primary,
                      borderWidth: 0.0,
                      title: "Creer votre compte",
                      textColor: Colors.white,
                      height: 50,
                      margin: 0),
                ),
              ),

              SizedBox(
                height: 50,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
