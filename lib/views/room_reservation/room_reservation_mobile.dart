part of room_reservation_view;

class _RoomReservationMobile extends StatelessWidget {
  final RoomReservationViewModel viewModel;

  _RoomReservationMobile(this.viewModel);

  Widget _formBox(context) {
    return FormBuilder(
        key: viewModel.formKey,
        initialValue: {},
        autovalidateMode: AutovalidateMode.disabled,
        child: Column(
          children: <Widget>[
            ShareWidget.input(
              name: "name",
              labelText: "Nom & prénoms",
              hintText: "${viewModel.userData?.name}",
              backgroundColors: Colors.white,
              borderColor: Color(0xffC4C4C4),
            ),
            SizedBox(
              height: 10,
            ),
            GestureDetector(
              onTap: () => viewModel.onTypeSejour(context),
              child: ShareWidget.input(
                name: "type_sejour",
                labelText: "Type de séjour",
                hintText: "${viewModel.typeSejour}",
                enabled: false,
                suffixIcon: Image.asset("assets/icons/dropdown2.png"),
                backgroundColors: Colors.white,
                borderColor: Color(0xffC4C4C4),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            GestureDetector(
              onTap: () => viewModel.onNbrChambre(context),
              child: ShareWidget.input(
                name: "nbre_chambre",
                labelText: "Nombre de chambre",
                hintText: "${viewModel.nbreChambre}",
                enabled: false,
                suffixIcon: Image.asset("assets/icons/dropdown2.png"),
                backgroundColors: Colors.white,
                borderColor: Color(0xffC4C4C4),
                
              ),
            ),
            SizedBox(
              height: 10,
            ),
            ShareWidget.input(
              name: "contact",
              labelText: "Contact client",
              hintText:
                  "${(viewModel.userData?.phone != null) ? viewModel.userData?.phone : ''}",
              prefixIcon: GestureDetector(
                onTap: () => viewModel.countryFlag(context),
                child: Container(
                  width: 70,
                  child: Row(
                    children: [
                      SizedBox(
                        width: 10,
                      ),
                      SvgPicture.network(
                        viewModel.country!.flag,
                        width: 30,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Image.asset("assets/icons/dropdown3.png")
                    ],
                  ),
                ),
              ),
              backgroundColors: Colors.white,
              borderColor: Color(0xffC4C4C4),
              
            ),
            SizedBox(
              height: 10,
            ),
            ShareWidget.input(
              name: "address",
              labelText: "Adresse client",
              maxLines: 5,
              hintText:
                  "${(viewModel.userData?.address != null) ? viewModel.userData?.address : ''}",
              enabled: true,
              backgroundColors: Colors.white,
              borderColor: Color(0xffC4C4C4),
              
            ),
            SizedBox(
              height: 20,
            ),
            _modeBuy(context),
            SizedBox(
              height: 20,
            ),
            ShareWidget.boxReservationn1(
                labelText:
                    'Politique d’arrivée et de départ de l’Hotel',
                context: context,
                backgroundColor: Color(0xffFFF1F1),
                body: Container(
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AutoSizeText(
                        "Heure d'arrivée : de 14h à 17h",
                        maxLines: 1,
                        maxFontSize: 12,
                        minFontSize: 12,
                        overflow: TextOverflow.ellipsis,
                        style: AppTheme.globalFont(TextStyle(
                            fontWeight: FontWeight.w700, fontSize: 12)),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      AutoSizeText(
                        "Heure de départ : de 14h à 17h",
                        maxLines: 1,
                        maxFontSize: 12,
                        minFontSize: 12,
                        overflow: TextOverflow.ellipsis,
                        style: AppTheme.globalFont(TextStyle(
                            fontWeight: FontWeight.w700, fontSize: 12)),
                      ),
                    ],
                  ),
                )),
            SizedBox(
              height: 20,
            ),
            ShareWidget.boxReservationn1(
              labelText: 'Duree du séjour',
              context: context,
              body: GestureDetector(
                onTap: () => viewModel.onChoiseDate(context),
                child: ShareWidget.box2(
                    width: AppTheme.fullWidth(context),
                    labelText: "Choisissez la période",
                    backgroundColors: Colors.white,
                    borderColors: Color(0xffC4C4C4),
                    labelStyle: TextStyle(
                      fontSize: 14,
                    ),
                    borderRadius: 11,
                    padding: EdgeInsets.all(16),
                    body: Container(
                      child: Row(
                        children: [
                          Image.asset("assets/icons/calendar.png"),
                          SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: AutoSizeText(
                              "${viewModel.sPropParam.sejourValue}",
                              maxLines: 1,
                              maxFontSize: 13,
                              minFontSize: 13,
                              overflow: TextOverflow.ellipsis,
                              style: AppTheme.globalFont(TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 13,
                                  color: Color(0xff5787A4))),
                            ),
                          ),
                        ],
                      ),
                    )),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            ShareWidget.boxReservationn1(
                labelText: 'Heures',
                context: context,
                body: Row(
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: () => viewModel.onTime(context, 'start'),
                        child: ShareWidget.input(
                          name: "start",
                          labelText: "Arrivée",
                          labelStyle: TextStyle(
                            fontSize: 14,
                          ),
                          hintText: "${viewModel.hArrive.hour}:${viewModel.hArrive.minute}",
                          enabled: false,
                          suffixIcon: Image.asset("assets/icons/dropdown2.png"),
                          backgroundColors: Colors.white,
                          borderColor: Color(0xffC4C4C4),
                          
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 35,
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: () => viewModel.onTime(context, 'end'),
                        child: ShareWidget.input(
                          name: "end",
                          labelText: "Départ",
                          labelStyle: TextStyle(
                            fontSize: 14,
                          ),
                          fontSize: 9,
                          hintText: "${viewModel.hDepart.hour}:${viewModel.hDepart.minute}",
                          enabled: false,
                          suffixIcon: Image.asset("assets/icons/dropdown2.png"),
                          backgroundColors: Colors.white,
                          borderColor: Color(0xffC4C4C4),
                         
                        ),
                      ),
                    ),
                  ],
                )),
          ],
        ));
  }

  Widget _modeBuy(context) {
    return Container(
      padding: EdgeInsets.only(left: 0, right: 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex: 1,
            child: GestureDetector(
              onTap: () => viewModel.choseModeBuy(true),
              child: ShareWidget.buttonIcone(
                context: context,
                height: 50,
                body: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 15,
                    ),
                    Stack(children: [
                      Align(
                          alignment: Alignment.center,
                          child:
                              Image.asset("assets/icons/select-inactif.png")),
                      if (viewModel.isAccount)
                        Positioned(
                            bottom: 16,
                            left: 5,
                            child:
                                Image.asset("assets/icons/select-actif.png")),
                    ]),
                    SizedBox(
                      width: 20,
                    ),
                    Expanded(
                      child: AutoSizeText(
                        "Payer un acompte de 25%",
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                        style: AppTheme.globalFont(TextStyle(
                          fontSize: 12,
                          color: Colors.black,
                          fontWeight: FontWeight.w400,
                        )),
                        textAlign: TextAlign.start,
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                  ],
                ),
                textColor: Colors.black,
                borderColor: Color(0xffA3A3A3),
                borderWidth: 1.0,
              ),
            ),
          ),
          Container(
            width: 10,
          ),
          Expanded(
            flex: 1,
            child: GestureDetector(
              onTap: () => viewModel.choseModeBuy(false),
              child: ShareWidget.buttonIcone(
                context: context,
                height: 50,
                body: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 15,
                    ),
                    Stack(children: [
                      Align(
                          alignment: Alignment.center,
                          child:
                              Image.asset("assets/icons/select-inactif.png")),
                      if (!viewModel.isAccount)
                        Positioned(
                            bottom: 16,
                            left: 5,
                            child:
                                Image.asset("assets/icons/select-actif.png")),
                    ]),
                    SizedBox(
                      width: 20,
                    ),
                    Expanded(
                      child: AutoSizeText(
                        "Payer la totalité",
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: AppTheme.globalFont(TextStyle(
                          fontSize: 12,
                          color: Colors.black,
                          fontWeight: FontWeight.w400,
                        )),
                        textAlign: TextAlign.start,
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
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: LoadingOverlay(
          color: Colors.black38,
        progressIndicator: spinkit10,
        isLoading: viewModel.loader,
          child: SingleChildScrollView(
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  ShareWidget.headerStyle3(context: context),
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 20),
                    child: AutoSizeText(
                      "Détails réservation",
                      maxLines: 1,
                      maxFontSize: 18,
                      minFontSize: 18,
                      overflow: TextOverflow.ellipsis,
                      style: AppTheme.globalFont(
                          TextStyle(fontWeight: FontWeight.w600, fontSize: 18)),
                    ),
                  ),
                  (viewModel.isHotel)
                      ? Container(
                          child: ShareWidget.boxRoom(
                            //padding: EdgeInsets.all(10),
                            margin: EdgeInsets.all(20),
                            freeRoom: viewModel.freeRoom,
                            property: viewModel.property,
                            context: context,
                          ),
                        )
                      : Container(
                          child: ShareWidget.boxRoom1(
                            //padding: EdgeInsets.all(10),
                            margin: EdgeInsets.all(20),
                            property: viewModel.property,
                            context: context,
                          ),
                        ),
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                      margin: EdgeInsets.symmetric(horizontal: 20),
                      child: _formBox(context)),
                  Container(
                    margin:
                        EdgeInsets.only(top: 20, right: 15, left: 15, bottom: 20),
                    child: TextButton(
                      onPressed: () => viewModel.createReservation(context),
                      child: ShareWidget.button(
                        context: context,
                        backgoundColor: LightColor.primary,
                        title: "Creer une réservation",
                        margin: 0,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
        bottomNavigationBar: (viewModel.isBottom) ? BottomMenuWidget.home(
          context: context,
        ):null);
  }
}
