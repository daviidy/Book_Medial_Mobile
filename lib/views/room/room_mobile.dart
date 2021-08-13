part of room_view;

class _RoomMobile extends StatelessWidget {
  final RoomViewModel viewModel;

  _RoomMobile(this.viewModel);

  Widget _headerBox(context) {
    return Container(
      height: AppTheme.fullHeight(context) / 2,
      child: ClipRRect(
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(20.0),
            bottomRight: Radius.circular(20.0)),
        child: Stack(children: [
          Container(
            decoration: BoxDecoration(
              color: LightColor.primary,
              image: DecorationImage(
                image: AssetImage("assets/images/room.png"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20.0),
                  bottomRight: Radius.circular(20.0)),
              gradient: LinearGradient(
                colors: [
                  Color.fromARGB(0, 0, 0, 0),
                  Color.fromARGB(10, 0, 0, 0),
                  Color.fromARGB(40, 0, 0, 0),
                  Color.fromARGB(70, 0, 0, 0),
                ],
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(
                left: 30, right: 30, top: AppTheme.fullHeight(context) / 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: ShareWidget.buttonIcone(
                      context: context,
                      backgoundColor: Colors.white,
                      height: 44,
                      width: 44,
                      borderRadius: 30,
                      borderColor: Colors.white,
                      padding: EdgeInsets.all(10),
                      body: Center(
                          child: Icon(
                        Icons.arrow_back,
                        color: LightColor.primary,
                        size: 22,
                      )),
                      //shadowColors: Color(0x52F46600),
                      blurRadius: 5,
                      offset: Offset(0, 5)),
                ),
                ShareWidget.buttonIcone(
                    context: context,
                    backgoundColor: Colors.white,
                    height: 44,
                    width: 44,
                    borderRadius: 30,
                    borderColor: Colors.white,
                    padding: EdgeInsets.all(10),
                    body: Center(child: Image.asset("assets/icons/heart.png")),
                    //shadowColors: Color(0x52F46600),
                    blurRadius: 5,
                    offset: Offset(0, 5)),
              ],
            ),
          ),
        ]),
      ),
    );
  }

  Widget _infoBox(context) {
    return Container(
      margin: EdgeInsets.only(
          left: 20, right: 20, top: AppTheme.fullHeight(context) / 2.5),
      child: ShareWidget.boxMain(
          padding: EdgeInsets.all(30),
          body: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    flex: 6,
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
                          height: 5,
                        ),
                        AutoSizeText(
                          "Abidjan       Riviera Bonoumin",
                          maxLines: 1,
                          maxFontSize: 12,
                          minFontSize: 12,
                          overflow: TextOverflow.ellipsis,
                          style: AppTheme.globalFont(TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 12,
                              color: LightColor.textGrey)),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        AutoSizeText.rich(TextSpan(
                            style: AppTheme.globalFont(null),
                            children: [
                              TextSpan(
                                  text: "6000 Fcfa ",
                                  style: AppTheme.globalFont(TextStyle(
                                      color: LightColor.primary,
                                      fontWeight: FontWeight.w700,
                                      fontSize: 20))),
                              TextSpan(
                                  text: "/  Par nuit",
                                  style: AppTheme.globalFont(TextStyle(
                                      color: LightColor.textGrey,
                                      fontWeight: FontWeight.w400,
                                      fontSize: 12)))
                            ])),
                        SizedBox(
                          height: 15,
                        ),
                        Row(
                          children: [
                            Container(
                                width: 20,
                                height: 20,
                                margin: EdgeInsets.only(right: 5, bottom: 2),
                                child: Image.asset("assets/icons/star.png")),
                            AutoSizeText(
                              "4.9",
                              maxLines: 1,
                              maxFontSize: 16,
                              minFontSize: 16,
                              overflow: TextOverflow.ellipsis,
                              style: AppTheme.globalFont(TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 16,
                              )),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(
                      height: 118,
                      child: Stack(
                        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        // crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Positioned(
                            top: 0,
                            child: ShareWidget.buttonIcone(
                                context: context,
                                backgoundColor: LightColor.primary,
                                height: 44,
                                width: 44,
                                borderRadius: 30,
                                borderColor: LightColor.primary,
                                padding: EdgeInsets.all(10),
                                body: Center(
                                    child:
                                        Image.asset("assets/icons/call.png")),
                                shadowColors: Color(0x52F46600),
                                blurRadius: 5,
                                offset: Offset(0, 5)),
                          ),
                          Positioned(
                            bottom: 0,
                            child: ShareWidget.buttonIcone(
                                context: context,
                                backgoundColor: LightColor.primary,
                                height: 44,
                                width: 44,
                                borderRadius: 30,
                                borderColor: LightColor.primary,
                                padding: EdgeInsets.all(10),
                                body: Center(
                                    child: Image.asset("assets/icons/map.png")),
                                shadowColors: Color(0x52F46600),
                                blurRadius: 5,
                                offset: Offset(0, 5)),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              )
            ],
          )),
    );
  }

  Widget _menuBox(context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        children: [
          GestureDetector(
            onTap: () => viewModel.swithMenu(0),
            child: ShareWidget.menuTabBoxLabelStyle(
                context: context,
                isActive: (viewModel.menuIndex == 0),
                title: "Description"),
          ),
          SizedBox(
            width: 30,
          ),
          GestureDetector(
            onTap: () => viewModel.swithMenu(1),
            child: ShareWidget.menuTabBoxLabelStyle(
                context: context,
                isActive: (viewModel.menuIndex == 1),
                title: "Images"),
          )
        ],
      ),
    );
  }

  Widget _descriptionBox(context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 15),
      child: AutoSizeText(
        "Capi Luxury is the most luxurious luxury hotel segment of Capi, located in big... ",
        style: AppTheme.globalFont(
            TextStyle(fontSize: 16, color: Color(0xff828282))),
      ),
    );
  }

  Widget _imageBox(context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.symmetric(horizontal: 15),
          child: AutoSizeText(
            "Capi Luxury is the most luxurious luxury hotel segment of Capi, located in big... ",
            style: AppTheme.globalFont(
                TextStyle(fontSize: 16, color: Color(0xff828282))),
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 40),
          child: Stack(children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: 15),
              child: CarouselSlider(
                options: CarouselOptions(
                    autoPlay: false,
                    aspectRatio: 0.0,
                    viewportFraction: 1,
                    enlargeCenterPage: true,
                    onPageChanged: (index, reason) {
                      viewModel.current = index;
                    },
                    height: 160),
                items: imageSliders(context),
                carouselController: viewModel.controller,
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 60),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () => viewModel.controller.previousPage(),
                    child: ShareWidget.buttonIcone(
                        context: context,
                        width: 46,
                        height: 46,
                        backgoundColor: Colors.transparent,
                        borderWidth: 0.0,
                        borderColor: Colors.transparent,
                        body: Image.asset(
                          "assets/icons/arrow-left1.png",
                        )),
                  ),
                  GestureDetector(
                    onTap: () => viewModel.controller.nextPage(),
                    child: ShareWidget.buttonIcone(
                        context: context,
                        width: 46,
                        height: 46,
                        backgoundColor: Colors.transparent,
                        borderWidth: 0.0,
                        borderColor: Colors.transparent,
                        body: Image.asset("assets/icons/arrow-right1.png")),
                  )
                ],
              ),
            )
          ]),
        ),
        Container(
            margin: EdgeInsets.only(top: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: viewModel.imgList.asMap().entries.map((entry) {
                return GestureDetector(
                  onTap: () => viewModel.controller.animateToPage(entry.key),
                  child: Container(
                    width: viewModel.current == entry.key ? 20 : 6.0,
                    height: 6.0,
                    margin:
                        EdgeInsets.symmetric(vertical: 8.0, horizontal: 3.0),
                    decoration: BoxDecoration(
                        //shape: viewModel.current == entry.key ? BoxShape.rectangle : BoxShape.circle,
                        borderRadius: BorderRadius.circular(10.0),
                        color: (Theme.of(context).brightness == Brightness.dark
                                ? Colors.white
                                : LightColor.primary)
                            .withOpacity(
                                viewModel.current == entry.key ? 1 : 0.3)),
                  ),
                );
              }).toList(),
            )),
      ],
    );
  }

  List<Widget> imageSliders(context) {
    return viewModel.imgList
        .map((item) => Container(
              child: Container(
                margin: EdgeInsets.only(bottom: 10.0, left: 0, right: 0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                        color: Color(0xFFDDDDDD),
                        blurRadius: 15.0,
                        offset: Offset(0.0, 5))
                  ],
                ),
                child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                    child: Stack(
                      children: <Widget>[
                        Image.asset(item, fit: BoxFit.cover, width: 1000.0),
                      ],
                    )),
              ),
            ))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          child: Stack(
            children: [
              _headerBox(context),
              _infoBox(context),
              Container(
                margin: EdgeInsets.only(
                    top: AppTheme.fullHeight(context) / 1.5,
                    left: 10,
                    right: 10),
                child: Column(
                  children: [
                    _menuBox(context),
                    SizedBox(
                      height: 20,
                    ),
                    if(viewModel.menuIndex == 0) _descriptionBox(context),
                    if(viewModel.menuIndex == 1) _imageBox(context),
                    SizedBox(
                      height: 30,
                    ),
                    TextButton(
                      onPressed: () => null,
                      child: ShareWidget.button(
                          context: context,
                          title: "Voir les disponibilités",
                          margin: 15,
                          height: 45,
                          width: AppTheme.fullWidth(context),
                          backgoundColor: LightColor.primary),
                    ),
                    SizedBox(
                      height: 100,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
