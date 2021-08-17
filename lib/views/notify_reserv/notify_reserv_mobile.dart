part of notify_reserv_view;

class _NotifyReservMobile extends StatelessWidget {
  final NotifyReservViewModel viewModel;

  _NotifyReservMobile(this.viewModel);

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
                ShareWidget.headerStyle2(context: context, text1: "Retour"),
                Container(
                  padding: EdgeInsets.only(left: 20, top: 20, right: 20),
                  child: AutoSizeText(
                    "Détails réservation",
                    maxLines: 1,
                    maxFontSize: 20,
                    minFontSize: 20,
                    style: AppTheme.globalFont(TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        color: LightColor.primary)),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(left: 20, top: 30,right: 20),
                  child: AutoSizeText(
                    "Tissi Jean-Armel",
                    maxLines: 1,
                    maxFontSize: 20,
                    minFontSize: 20,
                    overflow: TextOverflow.ellipsis,
                    style: AppTheme.globalFont(TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                    )),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(left: 20, top: 5,right: 20),
                  child: AutoSizeText.rich(
                    TextSpan(
                        style: AppTheme.globalFont(TextStyle(
                            fontSize: 12, fontWeight: FontWeight.w600)),
                        children: [
                          TextSpan(
                            text: "Type de séjour : ",
                          ),
                          TextSpan(
                              text: "Long séjour",
                              style: TextStyle(
                                color: LightColor.primary,
                              ))
                        ]),
                    maxFontSize: 12,
                    maxLines: 1,
                    minFontSize: 12,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(left: 20, top: 20,right: 20),
                  child: Row(
                    children: [
                      Expanded(flex: 1, child: Image.asset("assets/icons/calendar.png")),
                      Expanded(
                        flex: 20,
                        child: Container(
                          padding: EdgeInsets.only(left: 10),
                          child: AutoSizeText.rich(
                            TextSpan(
                                style: AppTheme.globalFont(TextStyle(
                                    fontSize: 12, fontWeight: FontWeight.w600)),
                                children: [
                                  TextSpan(
                                    text: "Durée du séjour : ",
                                  ),
                                  TextSpan(
                                      text: "24 Juin - 25 Juin",
                                      style: TextStyle(
                                        color: LightColor.primary,
                                      ))
                                ]),
                            maxFontSize: 12,
                            maxLines: 1,
                            minFontSize: 12,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                Container(
                  padding: EdgeInsets.only(left: 47, top: 5,right: 20),
                  child: AutoSizeText(
                    "(6 jours)",
                    maxLines: 1,
                    maxFontSize: 12,
                    minFontSize: 12,
                    overflow: TextOverflow.ellipsis,
                    style: AppTheme.globalFont(TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: LightColor.primary)),
                  ),
                ),

                Container(
                  padding: EdgeInsets.only(left: 20, top: 10, right: 20),
                  child: Row(
                    children: [
                      Expanded(flex: 1, child: Image.asset("assets/icons/heure.png")),
                      Expanded(
                        flex: 20,
                        child: Container(
                          padding: EdgeInsets.only(left: 10),
                          child: AutoSizeText.rich(
                            TextSpan(
                                style: AppTheme.globalFont(TextStyle(
                                    fontSize: 12, fontWeight: FontWeight.w600)),
                                children: [
                                  TextSpan(
                                    text: "Heure d’arrivée : ",
                                  ),
                                  TextSpan(
                                      text: "11H00",
                                      style: TextStyle(
                                        color: LightColor.primary,
                                      ))
                                ]),
                            maxFontSize: 12,
                            maxLines: 1,
                            minFontSize: 12,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                Container(
                  padding: EdgeInsets.only(left: 20, top: 10, right: 20),
                  child: Row(
                    children: [
                      Expanded(flex: 1, child: Image.asset("assets/icons/heure.png")),
                      Expanded(
                        flex: 20,
                        child: Container(
                          padding: EdgeInsets.only(left: 10),
                          child: AutoSizeText.rich(
                            TextSpan(
                                style: AppTheme.globalFont(TextStyle(
                                    fontSize: 12, fontWeight: FontWeight.w600)),
                                children: [
                                  TextSpan(
                                    text: "Heure de départ : ",
                                  ),
                                  TextSpan(
                                      text: "20H00",
                                      style: TextStyle(
                                        color: LightColor.primary,
                                      ))
                                ]),
                            maxFontSize: 12,
                            maxLines: 1,
                            minFontSize: 12,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                

                Container(
                child: ShareWidget.boxRoom2(
                  //padding: EdgeInsets.all(10),
                  margin: EdgeInsets.all(20),
                  data: null,
                  context: context,
                  //route: "/room-reservation"
                ),
              ),

              ],
            ),
          ),
        ),
        bottomNavigationBar: BottomMenuWidget.notification(context: context));
  }
}
