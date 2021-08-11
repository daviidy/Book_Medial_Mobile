part of login_view;

class _LoginMobile extends StatelessWidget {
  final LoginViewModel viewModel;

  _LoginMobile(this.viewModel);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          // margin: EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 10,
              ),
              ShareWidget.headerStyle1(
                  context: context,
                  route: "/register",
                  text1: "Pas encore inscrit ? ",
                  text2: "Inscrivez-vous"),
              SizedBox(
                height: 10,
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
              )
            ],
          ),
        ),
      ),
    );
  }
}
