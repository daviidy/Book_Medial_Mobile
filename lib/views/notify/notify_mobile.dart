part of notify_view;

class _NotifyMobile extends StatelessWidget {
  final NotifyViewModel viewModel;

  _NotifyMobile(this.viewModel);

  Widget _box404(context, label) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset("assets/icons/404.png"),
        SizedBox(
          height: 20,
        ),
        AutoSizeText(
          "$label",
          style: AppTheme.globalFont(TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: Color(0xffC4C4C4))),
        ),
      ],
    );
  }

  Widget _loading(context) {
    return SkeletonLoader(
      builder: Column(
          children: [1, 2]
              .map((e) => ShareWidget.boxMain(
                  backgroundColor: Color(0xffF6F6F6),
                  shadowColor: Color(0x38000000),
                  shadowOfset: Offset(0.0, 4),
                  blurRadius: 5,
                  margin: EdgeInsets.all(10),
                  borderRadius: 10,
                  body: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AutoSizeText(
                          "Sexy suite",
                          maxLines: 1,
                          maxFontSize: 18,
                          minFontSize: 18,
                          overflow: TextOverflow.ellipsis,
                          style: AppTheme.globalFont(TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 18,
                              color: Colors.black)),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        AutoSizeText(
                          "24 Juin - 25 Juin          2 personnes, 1 cham",
                          maxLines: 1,
                          maxFontSize: 10,
                          minFontSize: 10,
                          overflow: TextOverflow.ellipsis,
                          style: AppTheme.globalFont(TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 10,
                              color: LightColor.primary)),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            AutoSizeText(
                              "D??tails r??servation",
                              maxLines: 1,
                              maxFontSize: 10,
                              minFontSize: 10,
                              overflow: TextOverflow.ellipsis,
                              style: AppTheme.globalFont(TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 10,
                                  color: Colors.black)),
                            ),
                            Container(
                              padding: EdgeInsets.only(top: 2),
                              child:
                                  Image.asset("assets/icons/arrow-right3.png"),
                            )
                          ],
                        )
                      ],
                    ),
                  )))
              .toList()),
    );
  }

  Widget _filterBox(context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 0),
      child: Row(
        children: [
          Expanded(flex: 2, child: Container()),
          Expanded(
            flex: 1,
            child: TextButton(
              onPressed: () => null,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Expanded(
                    flex: 4,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        AutoSizeText(
                          "Trier par",
                          maxLines: 1,
                          maxFontSize: 12,
                          minFontSize: 12,
                          overflow: TextOverflow.ellipsis,
                          style: AppTheme.globalFont(TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 12,
                              color: Colors.black)),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Image.asset("assets/icons/filtre.png"),
                      ],
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _reservationBox(context) {
    if (viewModel.isLogin) {
      return _loading(context);
    } else {
      return (viewModel.reservList.length > 0)
          ? _reservContent(context)
          : _box404(context, "Aucune r??servation");
    }
  }

  Widget _favoryBox(context) {
    return (viewModel.favoryList.list.length > 0)
        ? _favoryContent(context)
        : _box404(context, "Aucun favoris");
  }

  Widget _favoryContent(context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        children: [
          //_filterBox(context),
          SizedBox(height: 30,),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: viewModel.favoryList.list
                    .map((property) => ShareWidget.boxHotel1(
                          onTap: () => viewModel.detailProperty(context, property),
                          context: context,
                          height: 160,
                          width: AppTheme.fullWidth(context),
                          name: "${property.name}",
                          margin:
                              EdgeInsets.only(right: 10, bottom: 20, left: 10),
                          image: (property.medias!.length > 0)
                              ? property.medias![0].link
                              : null,
                          location: "${property.city}, ${property.country}",
                        ))
                    .toList(),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _reservContent(context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        children: [
          //_filterBox(context),
          SizedBox(height: 30,),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: viewModel.reservList
                    .map((b) => Container(
                          child: GestureDetector(
                            onTap: () => Navigator.pushNamed(
                                context, "/notification-reservation",
                                arguments: b),
                            child: ShareWidget.boxMain(
                              backgroundColor: Color(0xffF6F6F6),
                              shadowColor: Color(0x38000000),
                              shadowOfset: Offset(0.0, 4),
                              blurRadius: 5,
                              margin: EdgeInsets.all(10),
                              borderRadius: 10,
                              body: Container(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    AutoSizeText(
                                      "${(b.type_sejour == 'long') ? 'Long' : 'Court'} s??jour",
                                      maxLines: 1,
                                      maxFontSize: 18,
                                      minFontSize: 18,
                                      overflow: TextOverflow.ellipsis,
                                      style: AppTheme.globalFont(TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 18,
                                          color: Colors.black)),
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    AutoSizeText(
                                      "Enregistr?? le ${DateFormat('EEE, d MMM, yyyy', 'fr').format(b.created_at as DateTime)}",
                                      maxLines: 1,
                                      maxFontSize: 10,
                                      minFontSize: 10,
                                      overflow: TextOverflow.ellipsis,
                                      style: AppTheme.globalFont(TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 10,
                                          color: LightColor.primary)),
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        AutoSizeText(
                                          "D??tails r??servation",
                                          maxLines: 1,
                                          maxFontSize: 10,
                                          minFontSize: 10,
                                          overflow: TextOverflow.ellipsis,
                                          style: AppTheme.globalFont(TextStyle(
                                              fontWeight: FontWeight.w600,
                                              fontSize: 10,
                                              color: Colors.black)),
                                        ),
                                        Container(
                                          padding: EdgeInsets.only(top: 2),
                                          child: Image.asset(
                                              "assets/icons/arrow-right3.png"),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ))
                    .toList(),
              ),
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: DefaultTabController(
          length: 2,
          child: Column(
            children: <Widget>[
              Container(
                constraints: BoxConstraints(maxHeight: 150.0),
                child: Material(
                  color: Color(0xffFFFCE2),
                  child: TabBar(
                    controller: viewModel.tabController,
                    //onTap: (index) => viewModel.onTapTab(index, context),
                    indicatorColor: LightColor.primary,
                    indicator: BoxDecoration(
                        border: Border(
                            right: BorderSide(color: Color(0xffC4C4C4)),
                            left: BorderSide(color: Color(0xffC4C4C4)),
                            bottom: BorderSide(
                                color: LightColor.primary, width: 3))),
                    tabs: [
                      Tab(
                        child: Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset("assets/icons/resev.png"),
                              SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                child: AutoSizeText(
                                  "Liste des r??servations",
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  maxFontSize: 12,
                                  minFontSize: 12,
                                  style: AppTheme.globalFont(TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.black)),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Tab(
                        child: Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset("assets/icons/heart.png"),
                              SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                child: AutoSizeText(
                                  "Mes favoris",
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  maxFontSize: 12,
                                  minFontSize: 12,
                                  style: AppTheme.globalFont(TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.black)),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: TabBarView(
                  controller: viewModel.tabController,
                  children: [_reservationBox(context), _favoryBox(context)],
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar:
            BottomMenuWidget.notification(context: context, disable: true));
  }
}
