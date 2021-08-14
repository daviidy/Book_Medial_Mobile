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
              backgroundColors: Colors.white,
              borderColor: Color(0xffC4C4C4),
              validators: [
                FormBuilderValidators.required(context,
                    errorText: "Ce champs est requis")
              ],
            ),
            SizedBox(
              height: 10,
            ),
            ShareWidget.input(
              name: "sejour",
              labelText: "Type de séjour",
              hintText: "",
              enabled: false,
              suffixIcon: GestureDetector(
                  onTap: () => null,
                  child: Image.asset("assets/icons/dropdown2.png")),
              backgroundColors: Colors.white,
              borderColor: Color(0xffC4C4C4),
              validators: [
                FormBuilderValidators.required(context,
                    errorText: "Ce champs est requis")
              ],
            ),
            SizedBox(
              height: 20,
            ),
            ShareWidget.boxReservationn1(
              labelText: 'Duree du séjour',
              context: context,
              body: ShareWidget.box2(
                  width: AppTheme.fullWidth(context),
                  labelText: "A partir de",
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
                        AutoSizeText(
                          "Dim, 6 Mars, 2021 - Mar, 8 Mars, 2021",
                          maxLines: 1,
                          maxFontSize: 13,
                          minFontSize: 13,
                          overflow: TextOverflow.ellipsis,
                          style: AppTheme.globalFont(TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 13,
                              color: Color(0xff5787A4))),
                        ),
                      ],
                    ),
                  )),
            ),
            SizedBox(
              height: 20,
            ),
            ShareWidget.boxReservationn1(
                labelText: 'Duree du séjour',
                context: context,
                body: Row(
                  children: [
                    Expanded(
                      child: ShareWidget.input(
                        name: "sejour",
                        labelText: "A partir de",
                        labelStyle: TextStyle(
                          fontSize: 14,
                        ),
                        hintText: "",
                        enabled: false,
                        suffixIcon: GestureDetector(
                            onTap: () => null,
                            child: Image.asset("assets/icons/dropdown2.png")),
                        backgroundColors: Colors.white,
                        borderColor: Color(0xffC4C4C4),
                        validators: [
                          FormBuilderValidators.required(context,
                              errorText: "Ce champs est requis")
                        ],
                      ),
                    ),
                    SizedBox(width: 35,),
                    Expanded(
                      child: ShareWidget.input(
                        name: "sejour",
                        labelText: "Jusqu’a",
                        labelStyle: TextStyle(
                          fontSize: 14,
                        ),
                        hintText: "",
                        enabled: false,
                        suffixIcon: GestureDetector(
                            onTap: () => null,
                            child: Image.asset("assets/icons/dropdown2.png")),
                        backgroundColors: Colors.white,
                        borderColor: Color(0xffC4C4C4),
                        validators: [
                          FormBuilderValidators.required(context,
                              errorText: "Ce champs est requis")
                        ],
                      ),
                    ),
                  ],
                )),
          ],
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
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
              Container(
                child: ShareWidget.boxRoom(
                  //padding: EdgeInsets.all(10),
                  margin: EdgeInsets.all(20),
                  data: null,
                  context: context,
                  //route: "/room-reservation"
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  child: _formBox(context)),

              Container(
              margin: EdgeInsets.only(top: 20, right: 15, left: 15,bottom: 200),
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
      bottomNavigationBar: BottomMenuWidget.home(context:context,)
    );
  }
}
