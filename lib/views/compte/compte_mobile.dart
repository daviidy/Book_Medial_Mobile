part of compte_view;

class _CompteMobile extends StatelessWidget {
  final CompteViewModel viewModel;

  _CompteMobile(this.viewModel);

  Widget _menuBox(
      {required BuildContext context, required String title, String? route}) {
    return Container(
      height: 50,
      child: TextButton(
        onPressed: () =>
            (route != null) ? Navigator.pushNamed(context, route) : null,
        child: Row(
          children: [
            Expanded(
              flex: 10,
              child: AutoSizeText(
                "$title",
                maxLines: 1,
                maxFontSize: 14,
                minFontSize: 14,
                overflow: TextOverflow.ellipsis,
                style: AppTheme.globalFont(TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                    color: Colors.black)),
              ),
            ),
            Expanded(
                flex: 1, child: Image.asset("assets/icons/arrow-right2.png"))
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
          child: Container(
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.only(top: 20, right: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: Container(
                            padding: EdgeInsets.only(top: 5),
                            child: Image.asset("assets/icons/right-arrow.png")),
                      ),
                      // Container(
                      //     child: Image.asset(
                      //   "assets/images/logo-book-medial.png",
                      //   height: 40,
                      // )),

                      AutoSizeText.rich(TextSpan(
                          style: AppTheme.globalFont(TextStyle(
                              fontSize: 36, fontWeight: FontWeight.w700)),
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
                    ],
                  ),
                ),
                Container(
                  padding:
                      EdgeInsets.only(top: 30, right: 20, left: 20, bottom: 30),
                  child: Row(
                    children: [
                      Expanded(
                          flex: 1,
                          child: Column(
                            children: [
                              Container(
                                width: 53,
                                height: 53,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50.0),
                                  border: Border.all(
                                      width: 1.0, color: Colors.black),
                                  //color: Colors.black,
                                  image: (viewModel.profilPhoto != null)
                                      ? DecorationImage(
                                          image: FileImage(File(
                                              viewModel.profilPhoto!.path)),
                                          fit: BoxFit.cover,
                                        )
                                      : null,
                                ),
                                child: (viewModel.profilPhoto != null)
                                    ? null
                                    : Center(
                                        child: Image.asset(
                                            "assets/icons/user2.png"),
                                      ),
                              ),
                              Container(
                                padding: EdgeInsets.only(top: 10),
                                child: GestureDetector(
                                  onTap: () => viewModel.updatePhoto(context),
                                  child: AutoSizeText(
                                    "Modifier la photo",
                                    maxLines: 1,
                                    maxFontSize: 10,
                                    minFontSize: 10,
                                    overflow: TextOverflow.ellipsis,
                                    style: AppTheme.globalFont(TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 10,
                                        color: LightColor.primary)),
                                  ),
                                ),
                              )
                            ],
                          )),
                      Expanded(
                          flex: 3,
                          child: Container(
                            margin: EdgeInsets.only(
                                left: AppTheme.fullWidth(context) / 5),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                AutoSizeText(
                                  "Bienvenue",
                                  maxLines: 1,
                                  maxFontSize: 14,
                                  minFontSize: 14,
                                  overflow: TextOverflow.ellipsis,
                                  style: AppTheme.globalFont(TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 14,
                                  )),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                AutoSizeText(
                                  "${viewModel.userData!.name}",
                                  maxLines: 2,
                                  maxFontSize: 24,
                                  minFontSize: 24,
                                  overflow: TextOverflow.ellipsis,
                                  style: AppTheme.globalFont(TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 24,
                                  )),
                                ),
                              ],
                            ),
                          ))
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _menuBox(
                          context: context,
                          title: "Modifier mes informations personnelles",
                          route: "/compte-info"),
                      _menuBox(context: context, title: "Mes réservations"),
                      _menuBox(context: context, title: "Mes favoris"),
                      Container(
                        margin: EdgeInsets.only(top: 50),
                        child: TextButton(
                          onPressed: () => viewModel.logout(context),
                          child: Row(
                            children: [
                              AutoSizeText(
                                "Se déconnecter",
                                maxLines: 1,
                                maxFontSize: 14,
                                minFontSize: 14,
                                overflow: TextOverflow.ellipsis,
                                style: AppTheme.globalFont(TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 14,
                                    color: LightColor.primary)),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
        bottomNavigationBar:
            BottomMenuWidget.profil(context: context, disable: true));
  }
}
