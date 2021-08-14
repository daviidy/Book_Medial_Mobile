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
              height: 20,
            ),
            ShareWidget.headerStyle2(context: context, text1: "Retour"),
            SizedBox(
              height: 15,
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
            Expanded(
              child: SingleChildScrollView(
                child: Container(
                  child: Column(
                      children: [1, 2, 3]
                          .map((e) => ShareWidget.boxRoom(
                              //padding: EdgeInsets.all(10),
                              margin: EdgeInsets.all(10),
                              data: null,
                              context: context,
                              route: "/room-reservation"))
                          .toList()),
                ),
              ),
            ),
            
          ],
        ),
      ),
    );
  }
}
