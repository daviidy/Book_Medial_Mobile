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
                      "${viewModel.sPropParam.locationValue}",
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
                      "${viewModel.sPropParam.sejourValue}       ${viewModel.sPropParam.personsValue}",
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
    if ((viewModel.propertyList.length > 0)) {
      List<Widget> _propData = viewModel.propertyList
          .map((property) => ShareWidget.boxHotel1(
                onTap: () => viewModel.detailProperty(context, property),
                context: context,
                height: 160,
                width: AppTheme.fullWidth(context),
                name: "${property.name}",
                margin: EdgeInsets.only(right: 10, bottom: 20, left: 10),
                image: (property.medias!.length > 0)
                    ? property.medias![0].link
                    : null,
                location: "${property.city}, ${property.country}",
              ))
          .toList();

      if (viewModel.isBackgroundLoad) {
        _propData = _propData + this._loaderBox(context);
      }
      return _propData;
    } else {
      return [this._box404(context, "Aucun trouvé")];
    }
  }

  List<Widget> _category(context) {
    if ((viewModel.categoryList.length > 0)) {
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
    } else {
      return [this._box404(context, "Aucun trouvé")];
    }
  }

  List<Widget> _loaderBox(context) {
    return [1, 2, 3]
        .map((popular) => SkeletonLoader(
              builder: ShareWidget.boxHotel1(
                param: null,
                context: context,
                height: 160,
                width: AppTheme.fullWidth(context),
                name: "room.name",
                margin: EdgeInsets.only(right: 10, bottom: 20, left: 10),
                //image: "assets/images/home1.png",
                location: "lieu",
              ),
            ))
        .toList();
  }

  Widget _box404(context, label) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 20,
          ),
          Image.asset("assets/icons/data-not-found.png"),
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
      ),
    );
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
                        child: Container(
                          margin: EdgeInsets.symmetric(horizontal: 10),
                          child: Column(
                            children: _loaderBox(context),
                          ),
                        ),
                      ),
                    )
                  : Expanded(
                      child: ListView(
                        controller: viewModel.scrollController,
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
