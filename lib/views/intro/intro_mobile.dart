part of intro_view;

class _IntroMobile extends StatelessWidget {
  final IntroViewModel viewModel;

  _IntroMobile(this.viewModel);

  Widget _topText(String text) {
    return AutoSizeText(
      "$text",
      maxLines: 1,
      maxFontSize: 20,
      minFontSize: 10,
      style: AppTheme.globalFont(
          TextStyle(fontSize: 20, fontWeight: FontWeight.w700)),
    );
  }

  Widget _bottomText(String text) {
    return AutoSizeText(
      "$text",
      maxLines: 1,
      maxFontSize: 16,
      minFontSize: 10,
      style: AppTheme.globalFont(
          TextStyle(fontSize: 16, fontWeight: FontWeight.w400)),
    );
  }

  List<Widget> imageSliders(context) {
    return viewModel.imgList
        .map((item) => Container(
              child: Container(
                margin: EdgeInsets.only(bottom: 15.0, left: 5, right: 5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                        color: Color(0xFFDDDDDD),
                        blurRadius: 15.0,
                        offset: Offset(0.0, 5))
                  ],
                ),
                child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                    child: Stack(
                      children: <Widget>[
                        //SvgPicture.asset(item),
                        Container(
                          //margin: EdgeInsets.only(bottom: 10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.0),
                            image: DecorationImage(
                              image: AssetImage(item),
                              fit: BoxFit.cover,
                            ),
                          ),
                          //child: SvgPicture.asset(item),
                        ),
                        Positioned(
                          bottom: 0.0,
                          left: 0.0,
                          right: 0.0,
                          child: Container(
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  Color.fromARGB(200, 255, 255, 255),
                                  Color.fromARGB(190, 255, 255, 255),
                                  Color.fromARGB(100, 255, 255, 255),
                                  Color.fromARGB(0, 255, 255, 255)
                                ],
                                begin: Alignment.bottomCenter,
                                end: Alignment.topCenter,
                              ),
                            ),
                            padding: EdgeInsets.only(top: (AppTheme.fullHeight(context) / 1.9)/3, bottom: 10),
                            child: TextButton(
                              //padding: EdgeInsets.all(0),
                              onPressed: () => Navigator.pushNamed(context, '/login'),
                              child: ShareWidget.button(
                                  context: context,
                                  title: 'Démarrez',
                                  textColor: Colors.black,
                                  borderColor: Colors.black,
                                  borderWidth: 2.0,
                                  width: AppTheme.fullWidth(context)),
                            ),
                          ),
                        ),
                      ],
                    )),
              ),
            ))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            margin: EdgeInsets.only(top: AppTheme.fullHeight(context) / 10),
            child: Center(
                child: Column(
              children: [
                _topText("Takes you to the"),
                SizedBox(
                  height: 5,
                ),
                _topText("best places"),
              ],
            )),
          ),
          Container(
            margin: EdgeInsets.only(top: AppTheme.fullHeight(context) / 5),
            child: CarouselSlider(
              options: CarouselOptions(
                  autoPlay: false,
                  aspectRatio: 2.0,
                  enlargeCenterPage: true,
                  onPageChanged: (index, reason) {
                    viewModel.current = index;
                  },
                  height: AppTheme.fullHeight(context) / 1.9),
              items: imageSliders(context),
              carouselController: viewModel.controller,
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: AppTheme.fullHeight(context) / 1.35),
            child: Center(
                child: Column(
              children: [
                _bottomText("Lorem ipsum dolor sit amet,"),
                SizedBox(
                  height: 5,
                ),
                _bottomText("consectetur adipiscing elit, sed do"),
                SizedBox(
                  height: 5,
                ),
                _bottomText("eiusmod tempor incid"),
              ],
            )),
          ),
          Container(
              margin: EdgeInsets.only(top: AppTheme.fullHeight(context) / 1.1),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: viewModel.imgList.asMap().entries.map((entry) {
                  return GestureDetector(
                    onTap: () => viewModel.controller.animateToPage(entry.key),
                    child: Container(
                      width: viewModel.current == entry.key ? 20 : 6.0,
                      height: 6.0,
                      margin:
                          EdgeInsets.symmetric(vertical: 8.0, horizontal: 3.0),
                      decoration: BoxDecoration(
                          //shape: viewModel.current == entry.key ? BoxShape.rectangle : BoxShape.circle,
                          borderRadius: BorderRadius.circular(10.0),
                          color: (Theme.of(context).brightness ==
                                      Brightness.dark
                                  ? Colors.white
                                  : LightColor.primary)
                              .withOpacity(
                                  viewModel.current == entry.key ? 1 : 0.3)),
                    ),
                  );
                }).toList(),
              ))
        ],
      ),
    );
  }
}
