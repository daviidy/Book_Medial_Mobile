part of login_view;

class _LoginMobile extends StatelessWidget {
  final LoginViewModel viewModel;

  _LoginMobile(this.viewModel);

  Widget _loginForm(context) {
    return FormBuilder(
        key: viewModel.loginFormKey,
        initialValue: {},
        autovalidateMode: AutovalidateMode.disabled,
        child: Column(
          children: <Widget>[
            ShareWidget.input(
              name: "email",
              labelText: "Nom utilisateur ou Adresse mail",
              validators: [
                FormBuilderValidators.required(context,
                    errorText: "Ce champs est requis")
              ],
            ),
            SizedBox(
              height: AppTheme.fullHeight(context) / 50,
            ),
            ShareWidget.input(
                name: "password",
                labelText: "Mot de passe",
                rightLabel: GestureDetector(
                  onTap: () =>
                      Navigator.pushNamed(context, "/forget-password/step1"),
                  child: AutoSizeText(
                    "Mot de passe oublié ?",
                    style: AppTheme.globalFont(
                        TextStyle(fontSize: 14, color: Colors.black)),
                  ),
                ),
                validators: [
                  FormBuilderValidators.required(context,
                      errorText: "Ce champs est requis")
                ],
                obscureText: true),
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
                ShareWidget.headerStyle1(
                    context: context,
                    route: "/register",
                    text1: "Pas encore inscrit ? ",
                    text2: "Inscrivez-vous"),
                SizedBox(
                  height: 20,
                ),
                Container(
                  padding: EdgeInsets.only(left: 20),
                  child: AutoSizeText(
                    "Connectez-vous à",
                    maxLines: 1,
                    maxFontSize: 24,
                    minFontSize: 10,
                    style: AppTheme.globalFont(
                        TextStyle(fontSize: 24, fontWeight: FontWeight.w700)),
                  ),
                ),
                Container(
                    padding: EdgeInsets.only(left: 14),
                    child: Image.asset(
                      "assets/images/logo-book-medial.png",
                      height: 50,
                    )),
                // Container(
                //   padding: EdgeInsets.only(left: 20),
                //   child: AutoSizeText.rich(TextSpan(
                //       style: AppTheme.globalFont(
                //           TextStyle(fontSize: 24, fontWeight: FontWeight.w700)),
                //       children: [
                //         TextSpan(
                //             text: "Book ",
                //             style: TextStyle(
                //               color: LightColor.primary,
                //             )),
                //         TextSpan(
                //             text: "Médial",
                //             style: TextStyle(
                //               color: LightColor.second,
                //             ))
                //       ])),
                // ),
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
                        child: GestureDetector(
                          onTap: () => viewModel.loginGoogle(context),
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
                                  "Inscrivez-vous avec Google",
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
                        width: 20,
                      ),
                      Expanded(
                        flex: 1,
                        child: GestureDetector(
                          onTap: () => viewModel.loginFacebook(context),
                          child: ShareWidget.buttonIcone(
                              context: context,
                              height: 50,
                              body: Image.asset("assets/icons/facebook.png"),
                              textColor: Colors.black,
                              borderColor: Color(0xffA3A3A3),
                              borderWidth: 1.0,
                              padding: EdgeInsets.only(left: 15, right: 15)),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 30,
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
                  height: 20,
                ),
                Container(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: _loginForm(context)),
                SizedBox(
                  height: 50,
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 14),
                  child: TextButton(
                    onPressed: () => viewModel.login(context),
                    child: ShareWidget.button(
                        context: context,
                        backgoundColor: LightColor.primary,
                        borderWidth: 0.0,
                        title: "Connectez-vous",
                        textColor: Colors.white,
                        height: 50,
                        margin: 0),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
