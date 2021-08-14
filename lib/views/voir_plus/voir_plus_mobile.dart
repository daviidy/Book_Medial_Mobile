part of voir_plus_view;

class _VoirPlusMobile extends StatelessWidget {
  final VoirPlusViewModel viewModel;

  _VoirPlusMobile(this.viewModel);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
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
                margin: EdgeInsets.symmetric(horizontal: 10),
                child: ShareWidget.boxMain(
                  padding: EdgeInsets.only(left: 30, right: 30, top: 20,bottom: 20),
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
                            "Autour de moi",
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
              ),
              SizedBox(
                height: 50,
              ),
              Container(
                margin: EdgeInsets.only(left: 20, right: 20),
                child: AutoSizeText(
                  "${viewModel.roomGroup!.title}",
                  maxLines: 1,
                  maxFontSize: 18,
                  minFontSize: 18,
                  overflow: TextOverflow.ellipsis,
                  style: AppTheme.globalFont(
                      TextStyle(fontWeight: FontWeight.w600, fontSize: 18)),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  children: viewModel.roomGroup!.rooms
                      .map((room) => ShareWidget.boxHotel1(
                            room: room,
                            context: context,
                            height: 160,
                            width: AppTheme.fullWidth(context),
                            name: room.name,
                            margin: EdgeInsets.only(right: 10, bottom: 20, left: 10),
                            image: room.image, //"assets/images/home1.png",
                            location: "${room.location}",
                          ))
                      .toList(),
                ),
              ),
            ],
          ),
        ),
      ),

      bottomNavigationBar: BottomMenuWidget.home(context:context,)
    );
  }
}
