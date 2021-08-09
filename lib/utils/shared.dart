import 'package:fluttertoast/fluttertoast.dart';

class SharedFunc {
  String msg;
  Toast? toastLength = Toast.LENGTH_SHORT;

  SharedFunc.toast({required this.msg, this.toastLength}) {
    Fluttertoast.showToast(
      msg: msg,
      toastLength: toastLength,
      // backgroundColor: Colors.black87,
      // textColor: Colors.white
    );
  }

  static String dateFormat({String? date}) {
    String rp = "---";
    if (date != null) {
      List d1 = date.split(" ");
      if (d1.length == 2) {
        List d2 = d1[0].split("-");
        if (d2.length == 3) {
          rp = "${d2[2]}/${d2[1]}/${d2[0]}";
        }
      }
    }

    return rp;
  }
}
