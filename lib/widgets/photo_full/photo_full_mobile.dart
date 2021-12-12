part of photo_full_view;

class _PhotoFullMobile extends StatelessWidget {
  final PhotoFullViewModel viewModel;

  _PhotoFullMobile(this.viewModel);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
              child: Hero(
            tag: "${viewModel.photoTag}",
            child: PhotoView(
              imageProvider: NetworkImage(viewModel.photoUrl),
              backgroundDecoration: BoxDecoration(
                color: LightColor.black,
              ),
            ),
          )),
          Align(
            alignment: Alignment.topRight,
            child: Container(
              margin: EdgeInsets.only(top: (Platform.isIOS) ? 30 : 0),
              child: IconButton(
                  icon: Icon(
                    Icons.close,
                    color: Colors.white,
                  ),
                  onPressed: () => Navigator.pop(context)),
            ),
          ),
        ],
      ),
    );
  }
}
