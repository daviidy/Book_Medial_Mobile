part of room_disponible_view;

class _RoomDisponibleMobile extends StatelessWidget {
  final RoomDisponibleViewModel viewModel;

  _RoomDisponibleMobile(this.viewModel);
  Widget _searchForm(context) {
    return ShareWidget.boxMain(
      margin: EdgeInsets.all(10),
      body: Column(
        children: <Widget>[
          // GestureDetector(
          //   onTap: () => null,
          //   child: ShareWidget.box1(
          //     width: AppTheme.fullWidth(context),
          //     value: "${viewModel.sPropParam.locationValue}",
          //     labelText: "Destination",
          //   ),
          // ),
          // SizedBox(height: 5),
          Row(
            children: [
              Expanded(
                  child: GestureDetector(
                onTap: () => viewModel.onDate(context),
                child: ShareWidget.box1(
                  value: "${viewModel.sPropParam.sejourValue}",
                  labelText: "Période du séjour",
                  width: AppTheme.fullWidth(context),
                ),
              )),
              Container(
                width: 5,
              ),
              Expanded(
                child: GestureDetector(
                  onTap: () => viewModel.onNbrPersonne(context),
                  child: ShareWidget.box1(
                    value: "${viewModel.sPropParam.personsValue}",
                    labelText: "Nbre Personne",
                    width: AppTheme.fullWidth(context),
                  ),
                ),
              )
            ],
          ),
          SizedBox(
            height: AppTheme.fullHeight(context) / 50,
          ),
          GestureDetector(
            onTap: () => viewModel.onSearch(context),
            child: ShareWidget.button(
                context: context,
                backgoundColor: LightColor.primary,
                borderWidth: 0.0,
                title: "Rechercher",
                textColor: Colors.white,
                height: 40,
                margin: 0),
          ),
        ],
      ),
    );
  }

  Widget _searchResume(context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
      child: GestureDetector(
        onTap: () => viewModel.isActiveSearch = true,
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

  List<Widget> _roomList(context) {
    if ((viewModel.isLoad)) {
      return _loaderBox(context);
    } else {
      return (viewModel.freeRoom!.length > 0)
          ? viewModel.freeRoom!
              .map((free) => ShareWidget.boxRoom3(
                  //padding: EdgeInsets.all(10),
                  margin: EdgeInsets.all(10),
                  freeRoom: free,
                  property: viewModel.property,
                  context: context,
                  onPressed: () =>
                      viewModel.reserver(context: context, freeRoom: free),
                  route: "/room-reservation"))
              .toList()
          : [_box404(context, "Aucune disponibilité")];
    }
  }

  List<Widget> _propertyAppartement(context) {
    if ((viewModel.isLoad)) {
      return _loaderBox(context);
    } else {
      return (viewModel.isPropDispo)
          ? [
              ShareWidget.boxRoom1(
                  //padding: EdgeInsets.all(10),
                  margin: EdgeInsets.all(10),
                  property: viewModel.property,
                  context: context,
                  onPressed: () => viewModel.reserver(context: context),
                  route: "/room-reservation")
            ]
          : [_box404(context, "Aucune disponibilité")];
    }
  }

  Widget _title(context) {
    return (viewModel.isHotel)
        ? Container(
            margin: EdgeInsets.symmetric(horizontal: 20),
            child: AutoSizeText(
              "Voici les chambres disponibles pour la période du ${viewModel.sPropParam.sejourValue}",
              maxLines: 2,
              maxFontSize: 18,
              minFontSize: 18,
              overflow: TextOverflow.ellipsis,
              style: AppTheme.globalFont(
                  TextStyle(fontWeight: FontWeight.w600, fontSize: 18)),
            ),
          )
        : Container(
            margin: EdgeInsets.symmetric(horizontal: 20),
            child: AutoSizeText(
              "La propriété est disponible pour la période du ${viewModel.sPropParam.sejourValue}",
              maxLines: 2,
              maxFontSize: 18,
              minFontSize: 18,
              overflow: TextOverflow.ellipsis,
              style: AppTheme.globalFont(
                  TextStyle(fontWeight: FontWeight.w600, fontSize: 18)),
            ),
          );
  }

  List<Widget> _loaderBox(context) {
    return [1, 2]
        .map((popular) => SkeletonLoader(
              builder: ShareWidget.boxRoom(
                  //padding: EdgeInsets.all(10),
                  margin: EdgeInsets.all(10),
                  data: null,
                  context: context,
                  route: "/room-reservation"),
            ))
        .toList();
  }

  Widget _box404(context, label) {
    return Container(
      margin: EdgeInsets.all(10),
      child: ShareWidget.boxReservationn1(
        maxLines: 3,
        labelText: 'Désolé il n’y pas de disponibilité pour la période du ${viewModel.sPropParam.sejourValue}',
        context: context,
        backgroundColor: Color(0xffFFF1F1),
        body: Container(),
      ),
    );
    // Container(
    //   width: double.infinity,
    //   child: Column(
    //     mainAxisAlignment: MainAxisAlignment.center,
    //     children: [
    //       SizedBox(
    //         height: 20,
    //       ),
    //       Image.asset("assets/icons/data-not-found.png"),
    //       SizedBox(
    //         height: 20,
    //       ),
    //       AutoSizeText(
    //         "$label",
    //         style: AppTheme.globalFont(TextStyle(
    //             fontSize: 18,
    //             fontWeight: FontWeight.w600,
    //             color: Color(0xffC4C4C4))),
    //       ),
    //     ],
    //   ),
    // );
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
              (viewModel.isActiveSearch)
                  ? _searchForm(context)
                  : _searchResume(context),
              SizedBox(
                height: 20,
              ),
              ShareWidget.headerStyle2(context: context, text1: "Retour"),
              SizedBox(
                height: 15,
              ),
              if(viewModel.isPropDispo || viewModel.freeRoom!.length > 0)
              _title(context),
              SizedBox(
                height: 30,
              ),
              // if(viewModel.isPropDispo || viewModel.freeRoom!.length > 0)
              // Container(
              //   margin: EdgeInsets.symmetric(horizontal: 0),
              //   child: Row(
              //     children: [
              //       Expanded(flex: 2, child: Container()),
              //       Expanded(
              //         flex: 1,
              //         child: TextButton(
              //           onPressed: () => null,
              //           child: Row(
              //             mainAxisAlignment: MainAxisAlignment.end,
              //             children: [
              //               Expanded(
              //                 flex: 4,
              //                 child: Column(
              //                   crossAxisAlignment: CrossAxisAlignment.end,
              //                   children: [
              //                     AutoSizeText(
              //                       "Trier par",
              //                       maxLines: 1,
              //                       maxFontSize: 12,
              //                       minFontSize: 12,
              //                       overflow: TextOverflow.ellipsis,
              //                       style: AppTheme.globalFont(TextStyle(
              //                           fontWeight: FontWeight.w600,
              //                           fontSize: 12,
              //                           color: Colors.black)),
              //                     ),
              //                   ],
              //                 ),
              //               ),
              //               Expanded(
              //                 flex: 1,
              //                 child: Column(
              //                   crossAxisAlignment: CrossAxisAlignment.end,
              //                   children: [
              //                     Image.asset("assets/icons/filtre.png"),
              //                   ],
              //                 ),
              //               )
              //             ],
              //           ),
              //         ),
              //       )
              //     ],
              //   ),
              // ),
              Expanded(
                child: SingleChildScrollView(
                  child: Container(
                    child: Column(
                        children: (viewModel.isHotel)
                            ? _roomList(context)
                            : _propertyAppartement(context)),
                  ),
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: (viewModel.isBottom) ? BottomMenuWidget.home(
          context: context,
        ):null);
  }
}
