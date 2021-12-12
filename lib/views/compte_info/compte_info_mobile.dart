part of compte_info_view;

class _CompteInfoMobile extends StatelessWidget {
  final CompteInfoViewModel viewModel;

  _CompteInfoMobile(this.viewModel);

  Widget _formBox(context) {
    return FormBuilder(
        key: viewModel.formKey,
        initialValue: {},
        autovalidateMode: AutovalidateMode.disabled,
        child: Column(
          children: <Widget>[
            ShareWidget.input(
              name: "name",
              labelText: "Nom et Prénoms",
              hintText: "${viewModel.userData!.name}",
              enabled: false, //viewModel.onUpdate,
              //backgroundColors: Colors.white,
              //borderColor: Color(0xffC4C4C4),
              validators: [],
            ),
            // SizedBox(
            //   height: 20,
            // ),
            // ShareWidget.input(
            //   name: "name",
            //   labelText: "Prénoms",
            //   hintText: "Armel",
            //   enabled: false, //viewModel.onUpdate,
            //   //backgroundColors: Colors.white,
            //   //borderColor: Color(0xffC4C4C4),
            //   validators: [
            //     FormBuilderValidators.required(context,
            //         errorText: "Ce champs est requis")
            //   ],
            // ),
            SizedBox(
              height: 20,
            ),
            ShareWidget.input(
              name: "name",
              labelText: "Contact",
              hintText: "${(viewModel.userData!.phone != null ) ? viewModel.userData!.phone : ''}",
              enabled: false, //viewModel.onUpdate,
              //backgroundColors: Colors.white,
              //borderColor: Color(0xffC4C4C4),
              validators: [
                FormBuilderValidators.required(context,
                    errorText: "Ce champs est requis")
              ],
            ),
            SizedBox(
              height: 20,
            ),
            ShareWidget.input(
              name: "name",
              labelText: "Email",
              hintText: "${viewModel.userData!.email}",
              enabled: false, //viewModel.onUpdate,
              //backgroundColors: Colors.white,
              //borderColor: Color(0xffC4C4C4),
              validators: [],
            ),
            SizedBox(
              height: 20,
            ),
            ShareWidget.input(
              name: "passwd",
              labelText: "Mot de passe",
              hintText: "******",
              enabled: viewModel.onUpdate,
              validators: [],
              obscureText: viewModel.obscureMp,
              suffixIcon: GestureDetector(
                  onTap: () => viewModel.obscureMp = !viewModel.obscureMp,
                  child: Image.asset("assets/icons/eye.png")),
            ),
          ],
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              ShareWidget.headerStyle2(
                  context: context, text1: "Informations personnelles"),
              SizedBox(
                height: 50,
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                child: _formBox(context),
              ),
              Container(
                margin: EdgeInsets.only(left: 15),
                child: TextButton(
                  onPressed: () => viewModel.activeUpdate(context),
                  child: Row(
                    children: [
                      AutoSizeText(
                        "Modifier le mot de passe",
                        maxLines: 1,
                        maxFontSize: 10,
                        minFontSize: 10,
                        overflow: TextOverflow.ellipsis,
                        style: AppTheme.globalFont(TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 10,
                            color: LightColor.primary)),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 14),
                child: TextButton(
                  onPressed: () => viewModel.save(context),
                  child: ShareWidget.button(
                      context: context,
                      backgoundColor: LightColor.primary,
                      borderWidth: 0.0,
                      title: "Sauvegarder",
                      textColor: Colors.white,
                      height: 50,
                      margin: 0),
                ),
              )
            ],
          ),
        ),
      ),
      //bottomNavigationBar: BottomMenuWidget.profil(context: context)
    );
  }
}
