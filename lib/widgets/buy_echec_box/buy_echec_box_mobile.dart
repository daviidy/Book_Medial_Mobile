part of buy_echec_box_view;

class _BuyEchecBoxMobile extends StatelessWidget {
  final BuyEchecBoxViewModel viewModel;

  _BuyEchecBoxMobile(this.viewModel);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Container(
        child: Column(
          //crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 20,
            ),
            Container(
                margin: EdgeInsets.symmetric(horizontal: 10),
                child: ShareWidget.headerStyle2(
                    context: context, text1: "Retour")),
            SizedBox(
              height: AppTheme.fullHeight(context) / 20,
            ),
            Container(
              margin: EdgeInsets.all(20),
              child: ShareWidget.boxReservationn1(
                labelText:
                    "Désolé une erreur s'est produite lors du paiement.",
                context: context,
                backgroundColor: Color(0xffFFF1F1),
                body: Container(),
              ),
            )
          ],
        ),
      ),
    ));
  }
}
