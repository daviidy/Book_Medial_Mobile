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
                  padding: EdgeInsets.only(left: 20, top: 30, right: 20),
                  child: AutoSizeText(
                    "${viewModel.userData?.name}",
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
                  padding: EdgeInsets.only(left: 20, top: 5, right: 20),
                  child: AutoSizeText.rich(
                    TextSpan(
                        style: AppTheme.globalFont(TextStyle(
                            fontSize: 12, fontWeight: FontWeight.w600)),
                        children: [
                          TextSpan(
                            text: "Type de séjour : ",
                          ),
                          TextSpan(
                              text:
                                  "${(viewModel.booking.type_sejour == 'long') ? 'Long' : 'Court'} séjour",
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
                  padding: EdgeInsets.only(left: 20, top: 20, right: 20),
                  child: Row(
                    children: [
                      Expanded(
                          flex: 1,
                          child: Image.asset("assets/icons/calendar.png")),
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
                                      text: "${viewModel.duree}",
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
                  padding: EdgeInsets.only(left: 47, top: 5, right: 20),
                  child: AutoSizeText(
                    "(${viewModel.nbrJr} ${viewModel.booking.type_sejour == 'court' ? 'heures' : 'nuit'})",
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
                      Expanded(
                          flex: 1,
                          child: Image.asset("assets/icons/heure.png")),
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
                                      text:
                                          "${viewModel.booking.startTime![0]}${viewModel.booking.startTime![1]}H${viewModel.booking.startTime![3]}${viewModel.booking.startTime![4]}",
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
                      Expanded(
                          flex: 1,
                          child: Image.asset("assets/icons/heure.png")),
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
                                      text:
                                          "${viewModel.booking.endTime![0]}${viewModel.booking.endTime![1]}H${viewModel.booking.endTime![3]}${viewModel.booking.endTime![4]}",
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
                // (viewModel.isLogin)
                //     ? SkeletonLoader(
                //         builder: Container(
                //           child: ShareWidget.boxRoom2(
                //             //padding: EdgeInsets.all(10),
                //             margin: EdgeInsets.all(20),
                //             data: null,
                //             context: context,
                //             //route: "/room-reservation"
                //           ),
                //         ),
                //       )
                //     : Container(
                //         child: ShareWidget.boxRoom2(
                //           //padding: EdgeInsets.all(10),
                //           margin: EdgeInsets.all(20),
                //           data: null,
                //           context: context,
                //           //route: "/room-reservation"
                //         ),
                //       ),
                SizedBox(
                  height: 30,
                ),
                Center(
                  child: Container(
                    child: QrImage(
                      data: "${viewModel.booking.qrcodeLink}",
                      version: QrVersions.auto,
                      size: AppTheme.fullWidth(context) / 2.5,
                    ),
                    decoration: BoxDecoration(
                        border:
                            Border.all(width: 1, color: LightColor.primary)),
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
                  margin: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
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
                  height: 30,
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: BottomMenuWidget.notification(context: context));
  }
}
