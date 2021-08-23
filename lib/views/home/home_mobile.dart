part of home_view;

class _HomeMobile extends StatelessWidget {
  final HomeViewModel viewModel;

  _HomeMobile(this.viewModel);

  Widget _searchForm(context) {
    return Column(
      children: <Widget>[
        ShareWidget.box1(
          width: AppTheme.fullWidth(context),
          value: "Abidjan",
          labelText: "Destination",
        ),
        SizedBox(height: 5),
        Row(
          children: [
            Expanded(
                child: ShareWidget.box1(
              value: "24 Juin - 25 Juin",
              labelText: "Date",
              width: AppTheme.fullWidth(context),
            )),
            Container(
              width: 5,
            ),
            Expanded(
              child: ShareWidget.box1(
                value: "2 personnes, 1 chambre qwwwwwwwwwww",
                labelText: "Chambre",
                width: AppTheme.fullWidth(context),
              ),
            )
          ],
        ),
        SizedBox(
          height: AppTheme.fullHeight(context) / 50,
        ),
        ShareWidget.button(
            context: context,
            backgoundColor: LightColor.primary,
            borderWidth: 0.0,
            title: "Rechercher",
            textColor: Colors.white,
            height: 40,
            margin: 0),
      ],
    );
  }

  Widget _searchResume(context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
      child: GestureDetector(
        onTap: () => viewModel.moveToTop(),
        child: ShareWidget.boxMain(
          padding: EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 20),
          body: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                flex: 1,
                child: Image.asset("assets/icons/loupe.png")),
             SizedBox(
                width: 10,
              ),
              Expanded(
                flex: 6,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AutoSizeText(
                      "Abidjan",
                      maxLines: 1,
                      maxFontSize: 14,
                      minFontSize: 14,
                      overflow: TextOverflow.ellipsis,
                      style: AppTheme.globalFont(TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 14,
                          color: Colors.black)),
                    ),
                    AutoSizeText(
                      "24 Juin - 25 Juin       2 personnes, 1 cham",
                      maxLines: 1,
                      maxFontSize: 12,
                      minFontSize: 12,
                      overflow: TextOverflow.ellipsis,
                      style: AppTheme.globalFont(TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 12,
                          color: Colors.black)),
                    ),
                  ],
                ),
              ),
              // SizedBox(
              //   width: 10,
              // ),
              Expanded(
                flex: 1,
                child: Image.asset("assets/icons/dropdown.png")),
            ],
          ),
        ),
      ),
    );
  }

  Widget _roomByCatBox(
      {required BuildContext context, required RoomGroup roomGroup}) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                flex: 3,
                child: AutoSizeText(
                  "${roomGroup.title}",
                  maxLines: 1,
                  maxFontSize: 18,
                  minFontSize: 18,
                  overflow: TextOverflow.ellipsis,
                  style: AppTheme.globalFont(
                      TextStyle(fontWeight: FontWeight.w600, fontSize: 18)),
                ),
              ),
              Expanded(
                flex: 1,
                child: TextButton(
                  onPressed: () => Navigator.pushNamed(context, "/voir-plus",
                      arguments: roomGroup),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      AutoSizeText(
                        "voir plus",
                        style: AppTheme.globalFont(TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 12,
                            color: LightColor.primary)),
                      ),
                      Image.asset("assets/icons/arrow-right.png")
                    ],
                  ),
                ),
              )
            ],
          ),
          SizedBox(
            height: 10,
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Container(
              padding: EdgeInsets.only(bottom: 10),
              child: Row(
                  children: roomGroup.rooms
                      .map((room) => ShareWidget.boxHotel1(
                            room: room,
                            context: context,
                            height: roomGroup.style!.height,
                            width: roomGroup.style!.width,
                            name: room.name,
                            margin: EdgeInsets.only(right: 10, left: 10),
                            image: room.image, //"assets/images/home1.png",
                            location: "${room.location}",
                          ))
                      .toList()),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(children: [
          Container(
            width: AppTheme.fullWidth(context),
            height: AppTheme.fullHeight(context),
            child: SingleChildScrollView(
              controller: viewModel.scrollController,
              child: Container(
                padding: EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.only(top: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(child: Image.asset("assets/images/logo-book-medial.png", height: 50,)),
                          // AutoSizeText.rich(TextSpan(
                          //     style: AppTheme.globalFont(TextStyle(
                          //         fontSize: 36, fontWeight: FontWeight.w700)),
                          //     children: [
                          //       TextSpan(
                          //           text: "Book ",
                          //           style: TextStyle(
                          //             color: LightColor.primary,
                          //           )),
                          //       TextSpan(
                          //           text: "Médial",
                          //           style: TextStyle(
                          //             color: LightColor.second,
                          //           ))
                          //     ])),
                          if (viewModel.isLogin)
                            TextButton(
                              onPressed: () =>
                                  Navigator.pushNamed(context, "/compte").then(
                                      (value) => (value != null)
                                          ? viewModel.isLogin = value as bool
                                          : null),
                              child: Container(
                                  child: Stack(children: [
                                Positioned(
                                    top: 9,
                                    left: 9,
                                    child:
                                        Image.asset("assets/icons/user.png")),
                                Image.asset("assets/icons/user-baground.png")
                              ])),
                            ),
                        ],
                      ),
                    ),
                    ShareWidget.boxMain(body: _searchForm(context)),
                    SizedBox(
                      height: 30,
                    ),
                    if (viewModel.isLogin)
                      Container(
                        child: Column(
                          children: viewModel.roomGroupList
                              .map((e) =>
                                  _roomByCatBox(context: context, roomGroup: e))
                              .toList(),
                        ),
                      ),
                    Container(
                      child: AutoSizeText(
                        "Besoin d'un hébergement",
                        maxLines: 1,
                        maxFontSize: 18,
                        minFontSize: 18,
                        overflow: TextOverflow.ellipsis,
                        style: AppTheme.globalFont(TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 18)),
                      ),
                    ),
                    Container(
                      child: AutoSizeText(
                        "proximité ?",
                        maxLines: 1,
                        maxFontSize: 18,
                        minFontSize: 18,
                        overflow: TextOverflow.ellipsis,
                        style: AppTheme.globalFont(TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 18)),
                      ),
                    ),
                    ShareWidget.boxHotel2(
                        context: context,
                        width: AppTheme.fullWidth(context),
                        padding: EdgeInsets.only(
                            right: 20, left: 20, top: 0, bottom: 10),
                        height: 132,
                        margin: EdgeInsets.only(top: 30),
                        body: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Row(
                              children: [
                                Image.asset("assets/icons/map.png"),
                                SizedBox(
                                  width: 10,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    AutoSizeText(
                                      "Autour de moi",
                                      maxLines: 1,
                                      maxFontSize: 18,
                                      minFontSize: 18,
                                      overflow: TextOverflow.ellipsis,
                                      style: AppTheme.globalFont(TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 18,
                                          color: Colors.white)),
                                    ),
                                    AutoSizeText(
                                      "24 Juin - 25 Juin       2 personnes, 1 cham",
                                      maxLines: 1,
                                      maxFontSize: 12,
                                      minFontSize: 12,
                                      overflow: TextOverflow.ellipsis,
                                      style: AppTheme.globalFont(TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 12,
                                          color: Colors.white)),
                                    ),
                                  ],
                                )
                              ],
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            TextButton(
                              onPressed: () => viewModel.proxiSearch(context),
                              child: ShareWidget.button(
                                  context: context,
                                  backgoundColor: Colors.white,
                                  borderWidth: 0.0,
                                  title: "Recherche à proximité",
                                  textColor: LightColor.primary,
                                  height: 32,
                                  margin: 0),
                            ),
                          ],
                        )),
                    if (!viewModel.isLogin)
                      ShareWidget.boxHotel2(
                          context: context,
                          margin: EdgeInsets.only(top: 30),
                          width: AppTheme.fullWidth(context),
                          padding: EdgeInsets.only(
                              right: 20, left: 20, top: 0, bottom: 10),
                          height: 132,
                          image: "assets/images/intro3.png",
                          body: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              AutoSizeText(
                                "Dormez bien on",
                                maxLines: 1,
                                maxFontSize: 24,
                                minFontSize: 24,
                                overflow: TextOverflow.ellipsis,
                                style: AppTheme.globalFont(TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 24,
                                    color: Colors.white)),
                              ),
                              AutoSizeText(
                                "s’occupe de vous",
                                maxLines: 1,
                                maxFontSize: 24,
                                minFontSize: 24,
                                overflow: TextOverflow.ellipsis,
                                style: AppTheme.globalFont(TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 18,
                                    color: Colors.white)),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              TextButton(
                                onPressed: () => Navigator.pushNamed(context, "/login"),
                                child: ShareWidget.button(
                                    context: context,
                                    backgoundColor: Colors.white,
                                    borderWidth: 0.0,
                                    title: "Creer un compte / Se connecter",
                                    textColor: LightColor.primary,
                                    height: 32,
                                    margin: 0),
                              ),
                            ],
                          )),
                    ShareWidget.boxHotel2(
                        context: context,
                        width: AppTheme.fullWidth(context),
                        margin: EdgeInsets.only(top: 30),
                        padding: EdgeInsets.only(
                            right: 20, left: 20, top: 0, bottom: 10),
                        height: 132,
                        image: "assets/images/intro2.png",
                        body: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AutoSizeText(
                              "Enregistrez un",
                              maxLines: 1,
                              maxFontSize: 24,
                              minFontSize: 24,
                              overflow: TextOverflow.ellipsis,
                              style: AppTheme.globalFont(TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 24,
                                  color: Colors.white)),
                            ),
                            AutoSizeText(
                              "hébergement",
                              maxLines: 1,
                              maxFontSize: 24,
                              minFontSize: 24,
                              overflow: TextOverflow.ellipsis,
                              style: AppTheme.globalFont(TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 18,
                                  color: Colors.white)),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            TextButton(
                              onPressed: () => null,
                              child: ShareWidget.button(
                                  context: context,
                                  backgoundColor: Colors.white,
                                  borderWidth: 0.0,
                                  title: "Enregistrez un hébergement",
                                  textColor: LightColor.primary,
                                  height: 32,
                                  margin: 0),
                            ),
                          ],
                        )),
                    SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
            ),
          ),
          if (viewModel.chowSearchResume)
            Container(
                height: 90,
                margin: EdgeInsets.only(left: 10, right: 10, top: 20),
                child: _searchResume(context))
        ]),
        bottomNavigationBar: BottomMenuWidget.home(context:context, disable: true));
  }
}
