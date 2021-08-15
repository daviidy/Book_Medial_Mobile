part of notify_view;

class _NotifyMobile extends StatelessWidget {
  final NotifyViewModel viewModel;

  _NotifyMobile(this.viewModel);

  Widget _box404(context, label) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset("assets/icons/404.png"),
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
    );
  }

  Widget _reservationBox(context) {
    return _box404(context, "Aucun réservation");
  }

  Widget _favoryBox(context) {
    return _box404(context, "Aucun favoris");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: DefaultTabController(
          length: 2,
          child: Column(
            children: <Widget>[
              Container(
                constraints: BoxConstraints(maxHeight: 150.0),
                child: Material(
                  color: Color(0xffFFFCE2),
                  child: TabBar(
                    indicatorColor: LightColor.primary,
                    indicator: BoxDecoration(
                        border: Border(
                            right: BorderSide(color: Color(0xffC4C4C4)),
                            left: BorderSide(color: Color(0xffC4C4C4)),
                            bottom: BorderSide(
                                color: LightColor.primary, width: 3))),
                    tabs: [
                      Tab(
                        child: Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset("assets/icons/resev.png"),
                              SizedBox(
                                width: 10,
                              ),
                              AutoSizeText(
                                "Liste des réservations",
                                style: AppTheme.globalFont(TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black)),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Tab(
                        child: Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset("assets/icons/heart.png"),
                              SizedBox(
                                width: 10,
                              ),
                              AutoSizeText(
                                "Mes favoris",
                                style: AppTheme.globalFont(TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black)),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: TabBarView(
                  children: [_reservationBox(context), _favoryBox(context)],
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar:
            BottomMenuWidget.notification(context: context, disable: true));
  }
}
