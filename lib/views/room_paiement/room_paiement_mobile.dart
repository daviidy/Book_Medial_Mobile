part of room_paiement_view;

class _RoomPaiementMobile extends StatelessWidget {
  final RoomPaiementViewModel viewModel;

  _RoomPaiementMobile(this.viewModel);

  Widget _tabMenu({
    required String label,
  }) {
    return ShareWidget.box2(
        labelText: "",
        borderRadius: 5,
        backgroundColors: Colors.white,
        borderColors: Color(0xFFC4C4C4),
        padding: EdgeInsets.only(top: 20, bottom: 30),
        body: Center(
          child: Row(
            children: [
              SizedBox(
                width: 20,
              ),
              AutoSizeText(
                "$label",
                maxLines: 1,
                maxFontSize: 14,
                minFontSize: 10,
                textAlign: TextAlign.start,
                overflow: TextOverflow.ellipsis,
                style: AppTheme.globalFont(TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                )),
              ),
            ],
          ),
        ));
  }

  Widget _tabHeader() {
    return Row(
      children: [
        Expanded(
            child: _tabMenu(
                label: viewModel.booking.type_paiement == "deposit"
                    ? "Payer un acompte"
                    : "Payer la totalité")), //"Payer la totalité"
      ],
    );
  }

  Widget _tabTotal(context) {
    return Container(
      child: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          Container(
            padding: EdgeInsets.only(left: 10, right: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  flex: 1,
                  child: GestureDetector(
                    onTap: () => viewModel.choseMode(BuyMode.orangeM),
                    child: ShareWidget.buttonIcone(
                      context: context,
                      blurRadius: 5,
                      height: 50,
                      body: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: AppTheme.fullWidth(context) / 55,
                          ),
                          Stack(children: [
                            Align(
                                alignment: Alignment.center,
                                child: Image.asset(
                                    "assets/icons/select-inactif.png")),
                            if ((viewModel.buyMode == BuyMode.orangeM))
                              Positioned(
                                  bottom: 16,
                                  left: 5,
                                  child: Image.asset(
                                      "assets/icons/select-actif.png")),
                          ]),
                          SizedBox(
                            width: 6,
                          ),
                          Image.asset("assets/images/orange-money.png",
                              width: AppTheme.fullWidth(context) / 8)
                        ],
                      ),
                      textColor: Colors.black,
                      borderColor: Color(0xffA3A3A3),
                      borderWidth: 1.0,
                    ),
                  ),
                ),
                Container(
                  width: AppTheme.fullWidth(context) / 55,
                ),
                Expanded(
                  flex: 1,
                  child: GestureDetector(
                    onTap: () => viewModel.choseMode(BuyMode.mtnM),
                    child: ShareWidget.buttonIcone(
                      context: context,
                      blurRadius: 5,
                      height: 50,
                      body: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: AppTheme.fullWidth(context) / 55,
                          ),
                          Stack(children: [
                            Align(
                                alignment: Alignment.center,
                                child: Image.asset(
                                    "assets/icons/select-inactif.png")),
                            if ((viewModel.buyMode == BuyMode.mtnM))
                              Positioned(
                                  bottom: 16,
                                  left: 5,
                                  child: Image.asset(
                                      "assets/icons/select-actif.png")),
                          ]),
                          SizedBox(
                            width: 10,
                          ),
                          Image.asset("assets/images/mtn-money.png",
                              width: AppTheme.fullWidth(context) / 10)
                        ],
                      ),
                      textColor: Colors.black,
                      borderColor: Color(0xffA3A3A3),
                      borderWidth: 1.0,
                    ),
                  ),
                ),
                Container(
                  width: AppTheme.fullWidth(context) / 55,
                ),
                Expanded(
                  flex: 1,
                  child: GestureDetector(
                    onTap: () => viewModel.choseMode(BuyMode.moovM),
                    child: ShareWidget.buttonIcone(
                      context: context,
                      blurRadius: 5,
                      height: 50,
                      body: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: AppTheme.fullWidth(context) / 55,
                          ),
                          Stack(children: [
                            Align(
                                alignment: Alignment.center,
                                child: Image.asset(
                                    "assets/icons/select-inactif.png")),
                            if ((viewModel.buyMode == BuyMode.moovM))
                              Positioned(
                                  bottom: 16,
                                  left: 5,
                                  child: Image.asset(
                                      "assets/icons/select-actif.png")),
                          ]),
                          SizedBox(
                            width: AppTheme.fullWidth(context) / 55,
                          ),
                          Image.asset(
                            "assets/images/moov-money.png",
                            width: AppTheme.fullWidth(context) / 8,
                          )
                        ],
                      ),
                      textColor: Colors.black,
                      borderColor: Color(0xffA3A3A3),
                      borderWidth: 1.0,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: 10, right: 10, top: 10),
            child: GestureDetector(
              onTap: () => viewModel.choseMode(BuyMode.visaC),
              child: ShareWidget.buttonIcone(
                context: context,
                blurRadius: 5,
                height: 50,
                body: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 1,
                      child: Container(
                        padding: EdgeInsets.only(left: 5),
                        child: Stack(children: [
                          Positioned(
                              bottom: 11,
                              left: 5,
                              child: Image.asset(
                                  "assets/icons/select-inactif.png")),
                          if ((viewModel.buyMode == BuyMode.visaC))
                            Positioned(
                                bottom: 16,
                                left: 10,
                                child: Image.asset(
                                    "assets/icons/select-actif.png")),
                        ]),
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          AutoSizeText(
                            "Payer par carte",
                            maxLines: 1,
                            maxFontSize: 14,
                            minFontSize: 14,
                            overflow: TextOverflow.ellipsis,
                            style: AppTheme.globalFont(TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                            )),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Image.asset("assets/images/visa.png")
                        ],
                      ),
                    ),
                  ],
                ),
                textColor: Colors.black,
                borderColor: Color(0xffA3A3A3),
                borderWidth: 1.0,
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          ShareWidget.boxMain(
            backgroundColor: Color(0xFFC7F5D1),
            shadowColor: Colors.transparent,
            shadowOfset: Offset(0.0, 0),
            blurRadius: 0,
            margin: EdgeInsets.symmetric(horizontal: 10),
            padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
            borderRadius: 10,
            body: Container(
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AutoSizeText.rich(TextSpan(
                        style: AppTheme.globalFont(TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                        )),
                        children: [
                          TextSpan(
                              text:
                                  "Vous serez redirigé vers l’interface de l’opérateur. Cliquez sur "),
                          TextSpan(
                              text: "RETOURNER SUR LE SITE MARCHAND ",
                              style: AppTheme.globalFont(TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w700,
                              ))),
                          TextSpan(
                              text:
                                  "après l’achat"),
                        ])),

                    
                  ],
                )),
          ),
          Container(
            margin: EdgeInsets.only(top: 0),
            child: TextButton(
              onPressed: () => viewModel.openWebView(context),
              child: ShareWidget.button(
                  context: context,
                  backgoundColor: LightColor.primary,
                  title: "Payer ${SharedFunc.numberFormat(viewModel.amount)}",
                  fontSize: 18,
                  margin: 0,
                  height: 50),
            ),
          )
        ],
      ),
    );
  }

  Widget _roomItem(context) {
    if ((viewModel.param?.type == VpParamType.property)) {
      return Container(
          child: Row(
        children: [
          Expanded(
            flex: 7,
            child: ShareWidget.boxMain(
              backgroundColor: Color(0xFFFFFCE2),
              shadowColor: Colors.transparent,
              shadowOfset: Offset(0.0, 0),
              blurRadius: 0,
              margin: EdgeInsets.symmetric(vertical: 5),
              padding: EdgeInsets.all(10),
              borderRadius: 10,
              body: Container(
                  padding: EdgeInsets.only(left: 10),
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AutoSizeText(
                        "${viewModel.property.name}",
                        maxLines: 1,
                        maxFontSize: 12,
                        minFontSize: 10,
                        style: AppTheme.globalFont(TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w700,
                        )),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      AutoSizeText.rich(TextSpan(
                          style: AppTheme.globalFont(TextStyle(
                              fontSize: 10, fontWeight: FontWeight.w700)),
                          children: [
                            TextSpan(
                              text: "Tarif : ",
                            ),
                            TextSpan(
                                text:
                                    "${SharedFunc.numberFormat(viewModel.amount / viewModel.nbreChambre)} Fcfa ",
                                style: TextStyle(color: Color(0xffFBBB00))),
                          ])),
                    ],
                  )),
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Expanded(
            child: AutoSizeText(
              "x${viewModel.nbreChambre}",
              maxLines: 1,
              maxFontSize: 14,
              minFontSize: 10,
              style: AppTheme.globalFont(TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w700,
              )),
            ),
          )
        ],
      ));
    } else {
      return Container(
          child: Row(
        children: [
          Expanded(
            flex: 7,
            child: ShareWidget.boxMain(
              backgroundColor: Color(0xFFFFFCE2),
              shadowColor: Colors.transparent,
              shadowOfset: Offset(0.0, 0),
              blurRadius: 0,
              margin: EdgeInsets.symmetric(vertical: 5),
              padding: EdgeInsets.all(10),
              borderRadius: 10,
              body: Container(
                  padding: EdgeInsets.only(left: 10),
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AutoSizeText(
                        "${viewModel.room.room_type?.name}",
                        maxLines: 1,
                        maxFontSize: 12,
                        minFontSize: 10,
                        style: AppTheme.globalFont(TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w700,
                        )),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      AutoSizeText.rich(TextSpan(
                          style: AppTheme.globalFont(TextStyle(
                              fontSize: 10, fontWeight: FontWeight.w700)),
                          children: [
                            TextSpan(
                              text: "Tarif : ",
                            ),
                            TextSpan(
                                text:
                                    "${SharedFunc.numberFormat(viewModel.amount / viewModel.nbreChambre)} Fcfa ",
                                style: TextStyle(color: Color(0xffFBBB00))),
                          ])),
                    ],
                  )),
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Expanded(
            child: AutoSizeText(
              "x${viewModel.nbreChambre}",
              maxLines: 1,
              maxFontSize: 14,
              minFontSize: 10,
              style: AppTheme.globalFont(TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w700,
              )),
            ),
          )
        ],
      ));
    }
  }

  Widget _buySuccessBox(context) {
    return SingleChildScrollView(
      child: Container(
        child: Column(
          //crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 20,
            ),
            Container(
                margin: EdgeInsets.symmetric(horizontal: 10),
                child: ShareWidget.headerStyle2(
                    context: context, text1: "Retour")),
            SizedBox(
              height: AppTheme.fullHeight(context) / 10,
            ),
            AutoSizeText(
              "Paiement effectué avec",
              maxLines: 1,
              maxFontSize: 18,
              minFontSize: 10,
              style: AppTheme.globalFont(TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w700,
              )),
            ),
            AutoSizeText(
              "succès",
              maxLines: 1,
              maxFontSize: 18,
              minFontSize: 10,
              style: AppTheme.globalFont(TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w700,
              )),
            ),
            SizedBox(
              height: 10,
            ),
            Image.asset("assets/icons/succes-pay.png"),
            SizedBox(
              height: 30,
            ),
            Center(
              child: Container(
                child: QrImage(
                  data: viewModel.qrcodeLink,
                  version: QrVersions.auto,
                  size: AppTheme.fullWidth(context) / 2.5,
                ),
                decoration: BoxDecoration(
                    border: Border.all(width: 1, color: LightColor.primary)),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            ShareWidget.boxMain(
              backgroundColor: Color(0xFFC7F5D1),
              shadowColor: Colors.transparent,
              shadowOfset: Offset(0.0, 0),
              blurRadius: 0,
              margin: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
              padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
              borderRadius: 10,
              body: Container(
                  child: Row(
                children: [
                  Expanded(
                      flex: 1, child: Image.asset("assets/icons/info.png")),
                  Expanded(
                      flex: 10,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          AutoSizeText(
                            "Veuillez présenter ce code QR à la",
                            maxLines: 1,
                            maxFontSize: 12,
                            minFontSize: 12,
                            overflow: TextOverflow.ellipsis,
                            style: AppTheme.globalFont(TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                            )),
                          ),
                          AutoSizeText(
                            "réception de votre hébergement",
                            maxLines: 1,
                            maxFontSize: 12,
                            minFontSize: 12,
                            overflow: TextOverflow.ellipsis,
                            style: AppTheme.globalFont(TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                            )),
                          ),
                        ],
                      ))
                ],
              )),
            ),
            SizedBox(
              height: 50,
            ),
            Container(
              width: double.infinity,
              child: Row(
                children: [
                  Expanded(
                    flex: 9,
                    child: Divider(
                      color: Color(0xffE4E4E4),
                      height: 20,
                      thickness: 1,
                      //indent: 20,
                      endIndent: 20,
                    ),
                  ),
                  Expanded(flex: 1, child: Container()),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: (viewModel.buyDone)
          ? _buySuccessBox(context)
          : SingleChildScrollView(
              child: Container(
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
                    Container(
                      padding: EdgeInsets.only(left: 20),
                      child: AutoSizeText(
                        "Paiement",
                        maxLines: 1,
                        maxFontSize: 20,
                        minFontSize: 10,
                        style: AppTheme.globalFont(TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                            color: LightColor.primary)),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 15),
                      child: Stack(
                        children: [
                          Container(
                            child: _tabHeader(),
                          ),
                          Container(
                              margin: EdgeInsets.only(top: 80),
                              width: double.infinity,
                              color: Color(0xffF0F0F0),
                              padding: EdgeInsets.all(10),
                              child: _tabTotal(context)),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 20),
                      child: AutoSizeText(
                        "Détails commande",
                        maxLines: 1,
                        maxFontSize: 18,
                        minFontSize: 10,
                        style: AppTheme.globalFont(TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                        )),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                        padding: EdgeInsets.only(left: 20),
                        child: _roomItem(context)),
                    SizedBox(
                      height: 30,
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 10),
                      child: ShareWidget.boxMain(
                        backgroundColor: Color(0xFFF0F0F0),
                        shadowColor: Color(0x38000000),
                        shadowOfset: Offset(0.0, 0),
                        blurRadius: 0,
                        margin: EdgeInsets.symmetric(horizontal: 10),
                        padding: EdgeInsets.all(10),
                        borderRadius: 10,
                        body: Container(
                            width: double.infinity,
                            child: AutoSizeText.rich(TextSpan(
                                style: AppTheme.globalFont(
                                    TextStyle(fontSize: 12)),
                                children: [
                                  TextSpan(
                                    text: "Vous devez payer ",
                                  ),
                                  TextSpan(
                                      text:
                                          "${SharedFunc.numberFormat(viewModel.amount)} Fcfa ",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w700,
                                          color: LightColor.primary)),
                                ]))),
                      ),
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
