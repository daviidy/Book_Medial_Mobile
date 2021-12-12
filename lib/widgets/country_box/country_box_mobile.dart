part of country_box_view;

class _CountryBoxMobile extends StatelessWidget {
  final CountryBoxViewModel viewModel;

  _CountryBoxMobile(this.viewModel);

  @override
  Widget build(BuildContext context) {
    return Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
        child: Container(
            padding: EdgeInsets.all(5),
            width: AppTheme.fullWidth(context),
            height: AppTheme.fullHeight(context) / 1.5,
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
                  child: ListTile(
                    leading: Icon(Icons.search),
                    contentPadding: EdgeInsets.only(left: 10, right: 10),
                    title: TextField(
                      onChanged: (text) {
                        viewModel.search();
                      },
                      style: TextStyle(color: LightColor.primary),
                      controller: viewModel.textController,
                      decoration: InputDecoration(
                          contentPadding:
                              EdgeInsets.fromLTRB(0.0, 10.0, 20.0, 10.0),
                          hintText: "Pays",
                          border:
                              OutlineInputBorder(borderSide: BorderSide.none)),
                    ),
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5.0),
                    //border: Border.all(width: 1.0, color: Color(0xffDFDBDB)),
                    // boxShadow: [
                    //   BoxShadow(
                    //       color: const Color(0x0d000000),
                    //       offset: Offset(0, 2),
                    //       blurRadius: 5)
                    // ],
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
                Expanded(
                  child: Container(
                    child: ListView.separated(
                      itemCount: viewModel.countryList.length,
                      separatorBuilder: (BuildContext context, int index) =>
                          Divider(
                        height: 0,
                      ),
                      itemBuilder: (BuildContext context, int index) {
                        return ListTile(
                          leading: Container(
                            width: 30,
                            child: SvgPicture.network(
                            viewModel.countryList[index].flag,
                            //width: 30,
                            height: 30,
                            semanticsLabel: 'A shark?!',
                            placeholderBuilder: (BuildContext context) =>
                                Container(
                                    width: 30,
                                    //height: 30,
                                    //padding: const EdgeInsets.all(30.0),
                                    child: spinkit2),
                        ),
                          ),
                          onTap: () => Navigator.pop(
                              context, viewModel.countryList[index]),
                          contentPadding: EdgeInsets.only(left: 10, right: 10),
                          title: Text(
                            '${viewModel.countryList[index].name} (${viewModel.countryList[index].callingCodes[0]})',
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                            style: AppTheme.globalFont(TextStyle(fontSize: 14)),
                          ),
                        );
                      },
                    ),
                  ),
                ),
                Container(
                  child: Row(
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
                ),
                // GestureDetector(
                //   onTap: () => Navigator.pop(context),
                //   child: ShareWidget.button(
                //       context: context,
                //       backgoundColor: LightColor.primary,
                //       borderWidth: 0.0,
                //       title: "Fermer",
                //       textColor: Colors.white,
                //       height: 30,
                //       margin: 0),
                // ),
              ],
            ))
    );
  }
}