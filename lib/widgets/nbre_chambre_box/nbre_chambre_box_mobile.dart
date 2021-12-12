part of nbre_chambre_box_view;

class _NbreChambreBoxMobile extends StatelessWidget {
  final NbreChambreBoxViewModel viewModel;

  _NbreChambreBoxMobile(this.viewModel);

  @override
  Widget build(BuildContext context) {
    return Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
        child: Container(
            padding: EdgeInsets.all(10),
            width: AppTheme.fullWidth(context),
            height: 198,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              color: const Color(0xffffffff),
              boxShadow: [
                BoxShadow(
                  color: const Color(0x17000000),
                  offset: Offset(0, 6),
                  blurRadius: 18,
                ),
              ],
            ),
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.only(top: 10, bottom: 10),
                  child: AutoSizeText(
                    "Nombre de chambre",
                    maxLines: 1,
                    maxFontSize: 18,
                    minFontSize: 18,
                    overflow: TextOverflow.ellipsis,
                    style: AppTheme.globalFont(
                        TextStyle(fontWeight: FontWeight.w600, fontSize: 18)),
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      child: Divider(
                        color: Color(0xffE4E4E4),
                        height: 0,
                        thickness: 1,
                        indent: 0,
                        endIndent: 0,
                      ),
                    ),
                  ],
                ),
                Container(
                  padding: EdgeInsets.only(top: 10, bottom: 10),
                  child: Row(
                    children: [
                      Container(
                        padding: EdgeInsets.only(top: 10),
                        child: AutoSizeText(
                          "Chambre",
                          maxLines: 1,
                          maxFontSize: 18,
                          minFontSize: 18,
                          overflow: TextOverflow.ellipsis,
                          style: AppTheme.globalFont(TextStyle(
                              fontWeight: FontWeight.w400, fontSize: 18)),
                        ),
                      ),
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            TextButton(
                              onPressed: () => viewModel.rmChambre(),
                              child: ShareWidget.boxMain(
                                  padding: EdgeInsets.all(5),
                                  borderRadius: 5,
                                  backgroundColor: Colors.red,
                                  body: Icon(
                                    Icons.remove,
                                    color: Colors.white,
                                  )),
                            ),
                            Container(
                              padding: EdgeInsets.only(top: 10),
                              width: 25,
                              child: AutoSizeText(
                                "${viewModel.nbrChambre}",
                                maxLines: 1,
                                maxFontSize: 18,
                                minFontSize: 18,
                                overflow: TextOverflow.ellipsis,
                                style: AppTheme.globalFont(TextStyle(
                                    fontWeight: FontWeight.w400, fontSize: 18)),
                              ),
                            ),
                            TextButton(
                              onPressed: () => viewModel.addChambre(),
                              child: ShareWidget.boxMain(
                                  padding: EdgeInsets.all(5),
                                  borderRadius: 5,
                                  backgroundColor: LightColor.primary,
                                  body: Icon(
                                    Icons.add,
                                    color: Colors.white,
                                  )),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                
                Row(
                  children: [
                    Expanded(
                      child: Divider(
                        color: Color(0xffE4E4E4),
                        height: 20,
                        thickness: 1,
                        indent: 0,
                        endIndent: 0,
                      ),
                    ),
                  ],
                ),
                GestureDetector(
                  onTap: () => viewModel.save(context),
                  child: ShareWidget.button(
                      context: context,
                      backgoundColor: LightColor.primary,
                      borderWidth: 0.0,
                      title: "Valider",
                      textColor: Colors.white,
                      height: 35,
                      margin: 0),
                ),
              ],
            )));
  }
}