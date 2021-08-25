part of voir_plus_view;

class _VoirPlusMobile extends StatelessWidget {
  final VoirPlusViewModel viewModel;

  _VoirPlusMobile(this.viewModel);

  Widget _searchResume(context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
      child: GestureDetector(
        onTap: () => null,
        child: ShareWidget.boxMain(
          padding: EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 20),
          body: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(flex: 1, child: Image.asset("assets/icons/loupe.png")),
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
                  flex: 1, child: Image.asset("assets/icons/dropdown.png")),
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> _property(context) {
    return viewModel.propertyList
        .map((property) => ShareWidget.boxHotel1(
              onTap: () => viewModel.detailProperty(context, property),
              context: context,
              height: 160,
              width: AppTheme.fullWidth(context),
              name: "${property.name}",
              margin: EdgeInsets.only(right: 10, bottom: 20, left: 10),
              image: (property.medias!.length > 0) ? property.medias![0].link : null,
              location: "${property.city}, ${property.country}",
            ))
        .toList();
  }

  List<Widget> _category(context) {
    return viewModel.categoryList
        .map((popular) => ShareWidget.boxHotel1(
              onTap: () => viewModel.detailPopular(context, popular),
              context: context,
              height: 160,
              width: AppTheme.fullWidth(context),
              name: "${popular.hebergement} hébergements",
              margin: EdgeInsets.only(right: 10, bottom: 20, left: 10),
              image: "${popular.media_link}",
              location: "${popular.city}",
            ))
        .toList();
  }

  List<Widget> _loaderBox(context) {
    return [1, 2, 3]
        .map((popular) => ShareWidget.boxHotel1(
              param: null,
              context: context,
              height: 160,
              width: AppTheme.fullWidth(context),
              name: "room.name",
              margin: EdgeInsets.only(right: 10, bottom: 20, left: 10),
              //image: "assets/images/home1.png",
              location: "lieu",
            ))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          margin: EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 20,
              ),
              ShareWidget.headerStyle2(context: context, text1: "Retour"),
              SizedBox(
                height: 10,
              ),
              _searchResume(context),
              SizedBox(
                height: 50,
              ),
              Container(
                margin: EdgeInsets.only(left: 20, right: 20),
                child: AutoSizeText(
                  "${viewModel.param.label}",
                  maxLines: 1,
                  maxFontSize: 18,
                  minFontSize: 18,
                  overflow: TextOverflow.ellipsis,
                  style: AppTheme.globalFont(
                      TextStyle(fontWeight: FontWeight.w600, fontSize: 18)),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              (viewModel.isLoad)
                  ? Expanded(
                      child: SingleChildScrollView(
                        child: SkeletonLoader(
                          builder: Container(
                            margin: EdgeInsets.symmetric(horizontal: 10),
                            child: Column(
                              children: _loaderBox(context),
                            ),
                          ),
                        ),
                      ),
                    )
                  : Expanded(
                      child: ListView(
                      children: (viewModel.param.type == VpParamType.category)
                          ? _category(context)
                          : _property(context),
                    )),
            ],
          ),
        ),
        bottomNavigationBar: BottomMenuWidget.home(
          context: context,
        ));
  }
}
