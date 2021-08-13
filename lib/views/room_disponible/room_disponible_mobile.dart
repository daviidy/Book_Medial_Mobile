part of room_disponible_view;

class _RoomDisponibleMobile extends StatelessWidget {
  final RoomDisponibleViewModel viewModel;

  _RoomDisponibleMobile(this.viewModel);

  Widget _searchResume(context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
      child: ShareWidget.boxMain(
        padding: EdgeInsets.only(left: 30, right: 30, top: 20, bottom: 20),
        body: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset("assets/icons/loupe.png"),
            SizedBox(
              width: 10,
            ),
            Column(
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
            SizedBox(
              width: 10,
            ),
            Image.asset("assets/icons/dropdown.png"),
          ],
        ),
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
            _searchResume(context),
            SizedBox(
              height: 30,
            ),
            ShareWidget.headerStyle2(context: context, text1: "Retour"),
            SizedBox(
              height: 20,
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              child: AutoSizeText(
                "Disponibilité selon la période",
                maxLines: 1,
                maxFontSize: 18,
                minFontSize: 18,
                overflow: TextOverflow.ellipsis,
                style: AppTheme.globalFont(
                    TextStyle(fontWeight: FontWeight.w600, fontSize: 18)),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              child: AutoSizeText(
                "choisie",
                maxLines: 1,
                maxFontSize: 18,
                minFontSize: 18,
                overflow: TextOverflow.ellipsis,
                style: AppTheme.globalFont(
                    TextStyle(fontWeight: FontWeight.w600, fontSize: 18)),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  Expanded(flex: 3, child: Container()),
                  Expanded(
                    flex: 1,
                    child: TextButton(
                      onPressed: () => null,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
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
                          SizedBox(
                            width: 10,
                          ),
                          Container(
                            child: Image.asset("assets/icons/filtre.png"),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            SingleChildScrollView(
              child: Container(
                child: Column(
                  children: [
                    ShareWidget.boxRoom(
                        //padding: EdgeInsets.all(10),
                        body: Column(
                      children: [
                        Row(
                          children: [
                            Expanded(
                              flex: 3,
                              child: AutoSizeText(
                                "Sexy Room",
                                maxLines: 1,
                                maxFontSize: 20,
                                minFontSize: 20,
                                overflow: TextOverflow.ellipsis,
                                style: AppTheme.globalFont(TextStyle(
                                    fontWeight: FontWeight.w700, fontSize: 20)),
                              ),
                            ),
                            Expanded(
                                flex: 1,
                                child: RatingBarIndicator(
                                  rating: 5,
                                  itemSize: 19,
                                  direction: Axis.horizontal,
                                  itemCount: 5,
                                  itemPadding:
                                      EdgeInsets.symmetric(horizontal: 0.0),
                                  itemBuilder: (context, _) => Icon(
                                    Icons.star,
                                    color: Colors.amber,
                                  ),
                                ))
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Container(
                              width: 30,
                              height: 20,
                              child: Image.asset("assets/icons/valide.png"),
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 5),
                              child: AutoSizeText(
                                "Climatisation - Ventilation - Wifi - Bar - Piscine",
                                maxLines: 1,
                                maxFontSize: 10,
                                minFontSize: 10,
                                overflow: TextOverflow.ellipsis,
                                style: AppTheme.globalFont(TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 10,
                                    color: Color(0xffFBBB00))),
                              ),
                            )
                          ],
                        ),
                        Row(
                          children: [
                            Container(
                              width: 30,
                              height: 20,
                              child: Image.asset("assets/icons/bed.png"),
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 5),
                              child: AutoSizeText(
                                "Lit simple / Largeur 90 - 130 ",
                                maxLines: 1,
                                maxFontSize: 10,
                                minFontSize: 10,
                                overflow: TextOverflow.ellipsis,
                                style: AppTheme.globalFont(TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 10,
                                    color: Color(0xffFBBB00))),
                              ),
                            )
                          ],
                        ),
                        Row(
                          children: [
                            Container(
                              width: 30,
                              height: 20,
                              child: Image.asset("assets/icons/personnes.png"),
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 5),
                              child: AutoSizeText(
                                "02 personnes",
                                maxLines: 1,
                                maxFontSize: 10,
                                minFontSize: 10,
                                overflow: TextOverflow.ellipsis,
                                style: AppTheme.globalFont(TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 10,
                                    color: Color(0xffFBBB00))),
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Expanded(
                                child: Container(
                              margin: EdgeInsets.only(left: 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  AutoSizeText(
                                    "Tarifs nuit",
                                    maxLines: 1,
                                    maxFontSize: 14,
                                    minFontSize: 14,
                                    overflow: TextOverflow.ellipsis,
                                    style: AppTheme.globalFont(TextStyle(
                                        fontWeight: FontWeight.w700,
                                        fontSize: 14,
                                        color: Colors.black)),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  AutoSizeText(
                                    "18000 Fcfa",
                                    maxLines: 1,
                                    maxFontSize: 14,
                                    minFontSize: 14,
                                    overflow: TextOverflow.ellipsis,
                                    style: AppTheme.globalFont(TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 14,
                                        color: Color(0xffFBBB00))),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  AutoSizeText(
                                    "12000 Fcfa",
                                    maxLines: 1,
                                    maxFontSize: 18,
                                    minFontSize: 18,
                                    overflow: TextOverflow.ellipsis,
                                    style: AppTheme.globalFont(TextStyle(
                                        fontWeight: FontWeight.w700,
                                        fontSize: 18,
                                        color: Color(0xffFBBB00))),
                                  ),
                                ],
                              ),
                            )),
                            Expanded(
                                child: Container(
                              margin: EdgeInsets.only(right: 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  AutoSizeText(
                                    "Tarifs heure",
                                    maxLines: 1,
                                    maxFontSize: 14,
                                    minFontSize: 14,
                                    overflow: TextOverflow.ellipsis,
                                    style: AppTheme.globalFont(TextStyle(
                                        fontWeight: FontWeight.w700,
                                        fontSize: 14,
                                        color: Colors.black)),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  AutoSizeText(
                                    "",
                                    maxLines: 1,
                                    maxFontSize: 14,
                                    minFontSize: 14,
                                    overflow: TextOverflow.ellipsis,
                                    style: AppTheme.globalFont(TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 14,
                                        color: Color(0xffFBBB00))),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  AutoSizeText(
                                    "5000 Fcfa",
                                    maxLines: 1,
                                    maxFontSize: 18,
                                    minFontSize: 18,
                                    overflow: TextOverflow.ellipsis,
                                    style: AppTheme.globalFont(TextStyle(
                                        fontWeight: FontWeight.w700,
                                        fontSize: 18,
                                        color: Color(0xffFBBB00))),
                                  ),
                                ],
                              ),
                            ))
                          ],
                        )
                      ],
                    ))
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
