part of home_view;

class _HomeMobile extends StatelessWidget {
  final HomeViewModel viewModel;

  _HomeMobile(this.viewModel);

  Widget _searchForm(context) {
    return Column(
      children: <Widget>[
        ShareWidget.box1(
          width: AppTheme.fullWidth(context),
          value: "Abidjan",
          labelText: "Destination",
        ),
        SizedBox(
          height: 5
        ),
        Row(
          children: [
            Expanded(
                child: ShareWidget.box1(
              value: "24 Juin - 25 Juin",
              labelText: "Date",
              width: AppTheme.fullWidth(context),
            )),
            Container(width: 5,),
            Expanded(
              child: ShareWidget.box1(
                value: "2 personnes, 1 chambre qwwwwwwwwwww",
                labelText: "Chambre",
                width: AppTheme.fullWidth(context),
              ),
            )
          ],
        ),
        SizedBox(
          height: AppTheme.fullHeight(context) / 50,
        ),
        ShareWidget.button(
            context: context,
            backgoundColor: LightColor.primary,
            borderWidth: 0.0,
            title: "Rechercher",
            textColor: Colors.white,
            height: 40,
            margin: 0),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Container(
              //padding: EdgeInsets.only(right: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  AutoSizeText.rich(TextSpan(
                      style: AppTheme.globalFont(
                          TextStyle(fontSize: 36, fontWeight: FontWeight.w700)),
                      children: [
                        TextSpan(
                            text: "Book ",
                            style: TextStyle(
                              color: LightColor.primary,
                            )),
                        TextSpan(
                            text: "Médial",
                            style: TextStyle(
                              color: LightColor.second,
                            ))
                      ])),
                  TextButton(
                    onPressed: () => null, //Navigator.pop(context),
                    child: Container(
                        child: Stack(children: [
                      Positioned(
                          top: 9,
                          left: 9,
                          child: Image.asset("assets/icons/user.png")),
                      Image.asset("assets/icons/user-baground.png")
                    ])),
                  ),
                ],
              ),
            ),
            
            ShareWidget.boxMain(
              body: _searchForm(context)
            )
          ],
        ),
      ),
    ));
  }
}
