part of paiement_web_view;

class _PaiementWebMobile extends StatelessWidget {
  final PaiementWebViewModel viewModel;

  _PaiementWebMobile(this.viewModel);

  @override
  Widget build(BuildContext context) {
    return WebviewScaffold(
      url: viewModel.url,
      appBar: new AppBar(
        title: const Text(''),
        centerTitle: true,
        backgroundColor: Colors.white,
        leading: Container(),
        actions: [
          IconButton(onPressed: () => Navigator.pop(context) , icon: Icon(Icons.close_rounded ,color: LightColor.primary,size: 29,)),
        ],
      ),
      withZoom: true,
      withLocalStorage: true,
      hidden: false,
      initialChild: Container(
        //color: Colors.redAccent,
        child: Center(
          child: spinkit8,
        ),
      ),
    );
  }
}