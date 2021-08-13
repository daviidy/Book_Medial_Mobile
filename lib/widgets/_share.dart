import 'package:auto_size_text/auto_size_text.dart';
import 'package:book_medial/core/models/room_models.dart';
import 'package:book_medial/theme/light_color.dart';
import 'package:book_medial/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class ShareWidget {
  static Widget button(
      {required BuildContext context,
      double? width,
      double borderWidth = 1.0,
      Color backgoundColor = const Color(0xffffffff),
      Color borderColor = const Color(0xffffffff),
      Color textColor = const Color(0xffffffff),
      String? title,
      double height = 40.0,
      double margin = 60}) {
    return Container(
      margin: EdgeInsets.only(left: margin, right: margin),
      width: width,
      height: height,
      child: Center(
        child: AutoSizeText(
          "$title",
          style: AppTheme.globalFont(TextStyle(
            fontSize: 14,
            color: textColor,
            fontWeight: FontWeight.w700,
          )),
          textAlign: TextAlign.center,
        ),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: backgoundColor,
        border: Border.all(width: borderWidth, color: borderColor),
        boxShadow: [
          BoxShadow(
              color: const Color(0x0d000000),
              offset: Offset(0, 2),
              blurRadius: 5)
        ],
      ),
    );
  }

  static Widget buttonIcone({
    required BuildContext context,
    double? width,
    double borderWidth = 1.0,
    Color backgoundColor = const Color(0xffffffff),
    Color borderColor = const Color(0xffffffff),
    Color textColor = const Color(0xffffffff),
    Widget? body,
    double height = 40.0,
    double borderRadius = 10.0,
    EdgeInsets padding = const EdgeInsets.all(0),
    EdgeInsets margin = const EdgeInsets.all(0),
    Color shadowColors = const Color(0x0d000000),
    Offset offset = const Offset(0, 2),
    double blurRadius = 5
  }) {
    return Container(
      margin: margin,
      padding: padding,
      //width: width,
      height: height,
      child: Center(child: body),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius),
        color: backgoundColor,
        border: Border.all(width: borderWidth, color: borderColor),
        boxShadow: [
          BoxShadow(
              color: shadowColors,
              offset: offset,
              blurRadius: blurRadius)
        ],
      ),
    );
  }

  static Widget headerStyle1({
    required BuildContext context,
    String? route,
    String? text1,
    String? text2,
  }) {
    return Container(
      padding: EdgeInsets.only(right: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Container(
                padding: EdgeInsets.only(top: 5),
                child: Image.asset("assets/icons/right-arrow.png")),
          ),
          TextButton(
            onPressed: () => (route != null)
                ? Navigator.pushNamed(context, "$route")
                : Navigator.pop(context),
            child: AutoSizeText.rich(TextSpan(
                style: AppTheme.globalFont(TextStyle(
                  fontSize: 14,
                  color: const Color(0xff313450),
                )),
                children: [
                  TextSpan(
                    text: "$text1",
                  ),
                  TextSpan(
                      text: "$text2",
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                      ))
                ])),
          )
        ],
      ),
    );
  }

  static Widget headerStyle2({
    required BuildContext context,
    String? text1 = "",
  }) {
    return Container(
      padding: EdgeInsets.only(right: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Container(
                padding: EdgeInsets.only(top: 5),
                child: Image.asset("assets/icons/right-arrow.png")),
          ),
          AutoSizeText(
            "$text1",
            style: AppTheme.globalFont(TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: const Color(0xff313450),
            )),
          ),
        ],
      ),
    );
  }

  static Widget input(
      {required String name,
      String? labelText,
      Widget rightLabel = const Text(""),
      Widget? suffixIcon,
      bool obscureText = false,
      bool showPassword = false,
      List<String? Function(dynamic)> validators = const []}) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AutoSizeText(
                "$labelText",
                style: AppTheme.globalFont(
                    TextStyle(fontWeight: FontWeight.w700, fontSize: 14)),
              ),
              rightLabel
            ],
          ),
          SizedBox(
            height: 5,
          ),
          Container(
            padding: EdgeInsets.only(left: 5, right: 5),
            child: Column(
              children: [
                FormBuilderTextField(
                  name: name,
                  obscureText: obscureText,
                  maxLines: 1,
                  style: AppTheme.globalFont(TextStyle(
                    fontSize: 14,
                  )),
                  decoration: InputDecoration(
                      suffixIcon: suffixIcon,
                      contentPadding:
                          EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                      // hintText: hintText,
                      errorStyle: AppTheme.globalFont(TextStyle(
                          fontSize: 10.0, fontStyle: FontStyle.italic)),
                      focusedErrorBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.red)),
                      border: OutlineInputBorder(borderSide: BorderSide.none)),
                  validator: FormBuilderValidators.compose(validators),
                ),
              ],
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color: const Color(0xffF6F6F6),
              border: Border.all(width: 1.0, color: const Color(0xffDFDBDB)),
              // boxShadow: [
              //   BoxShadow(
              //       color: const Color(0x0d000000),
              //       offset: Offset(0, 2),
              //       blurRadius: 5)
              // ],
            ),
          ),
        ],
      ),
    );
  }

  static Widget boxMain({
    Widget? body,
    EdgeInsets? margin = const EdgeInsets.only(top: 10),
    EdgeInsets? padding = const EdgeInsets.all(15),
  }) {
    return Container(
      // width: width,
      // height: height,
      margin: margin,
      padding: padding,
      //height: 456.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        color: const Color(0xffffffff),
        boxShadow: [
          BoxShadow(
              color: const Color(0x17000000),
              offset: Offset(0, 5),
              blurRadius: 20)
        ],
      ),
      child: body,
    );
  }

  static Widget box1(
      {String? value = "",
      String? labelText,
      double? width,
      EdgeInsets? padding = const EdgeInsets.all(10)}) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.only(left: 0),
            child: AutoSizeText(
              "$labelText",
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: AppTheme.globalFont(
                  TextStyle(fontWeight: FontWeight.w600, fontSize: 14)),
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Container(
            width: width,
            padding: padding,
            child: AutoSizeText("$value",
                maxLines: 1,
                minFontSize: 13,
                maxFontSize: 14,
                overflow: TextOverflow.ellipsis,
                style: AppTheme.globalFont(
                    TextStyle(fontWeight: FontWeight.w600, fontSize: 14))),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
              color: const Color(0xffF6F6F6),
              border: Border.all(width: 1.0, color: const Color(0xffDFDBDB)),
              // boxShadow: [
              //   BoxShadow(
              //       color: const Color(0x0d000000),
              //       offset: Offset(0, 2),
              //       blurRadius: 5)
              // ],
            ),
          ),
        ],
      ),
    );
  }

  static Widget boxHotel1({
    required BuildContext context,
    Room? room,
    String? route,
    String? name,
    String? location,
    String image = "assets/images/intro1.png",
    double? width = 50.0,
    double height = 50.0,
    EdgeInsets? margin = const EdgeInsets.all(0),
    EdgeInsets? padding = const EdgeInsets.all(0),
  }) {
    return GestureDetector(
      onTap: () => (room != null ) ? Navigator.pushNamed(context, "/room", arguments: room) : null,
      child: Container(
        width: width,
        height: height,
        margin: margin,
        padding: padding,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          color: Colors.black,
          image: DecorationImage(
            image: AssetImage(image),
            fit: BoxFit.cover,
          ),
          boxShadow: [
            BoxShadow(
                color: Colors.black26,
                offset: Offset(0, 4),
                blurRadius: 10)
          ],
        ),
        child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
              gradient: LinearGradient(
                colors: [
                  Color.fromARGB(200, 0, 0, 0),
                  Color.fromARGB(190, 0, 0, 0),
                  Color.fromARGB(100, 0, 0, 0),
                  Color.fromARGB(0, 0, 0, 0),
                  Color.fromARGB(0, 0, 0, 0),
                  Color.fromARGB(0, 0, 0, 0),
                  Color.fromARGB(0, 0, 0, 0),
                  Color.fromARGB(0, 0, 0, 0),
                ],
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
              ),
            ),
            padding: EdgeInsets.only(left: 20, bottom: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                AutoSizeText(
                  "Nom",
                  style: AppTheme.globalFont(TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                      fontWeight: FontWeight.w600)),
                ),
                SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    Image.asset("assets/icons/location.png"),
                    SizedBox(
                      width: 5,
                    ),
                    AutoSizeText(
                      "Lieu",
                      style: AppTheme.globalFont(TextStyle(
                          fontSize: 14,
                          color: Colors.white,
                          fontWeight: FontWeight.w400)),
                    ),
                  ],
                ),
              ],
            )),
      ),
    );
  }


  static Widget boxHotel2({
    required BuildContext context,
    Map? data,
    String? route,
    String? name,
    String? location,
    String image = "assets/images/intro1.png",
    double? width = 50.0,
    double height = 50.0,
    Widget? body,
    EdgeInsets? margin = const EdgeInsets.all(0),
    EdgeInsets? padding = const EdgeInsets.all(0),
  }) {
    return Container(
      width: width,
      height: height,
      margin: margin,
      padding: EdgeInsets.all(0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        color: Colors.black,
        image: DecorationImage(
          image: AssetImage(image),
          fit: BoxFit.cover,
        ),
        boxShadow: [
          BoxShadow(
              color: Colors.black26,
              offset: Offset(0, 4),
              blurRadius: 10)
        ],
      ),
      child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.0),
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(200, 0, 0, 0),
                Color.fromARGB(190, 0, 0, 0),
                Color.fromARGB(100, 0, 0, 0),
                Color.fromARGB(0, 0, 0, 0),
                // Color.fromARGB(0, 0, 0, 0),
                // Color.fromARGB(0, 0, 0, 0),
                // Color.fromARGB(0, 0, 0, 0),
                // Color.fromARGB(0, 0, 0, 0),
              ],
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
            ),
          ),
          padding: padding,
          child: body),
    );
  }


  static Widget menuTabBoxLabelStyle(
      {required BuildContext context,
      required bool isActive,
      required String title}) {
    return (isActive)
        ? Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AutoSizeText(
                "$title",
                maxLines: 1,
                maxFontSize: 20,
                minFontSize: 20,
                overflow: TextOverflow.ellipsis,
                style: AppTheme.globalFont(TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 20,
                    color: Colors.black)),
              ),
            SizedBox(height: 5,),
            Image.asset("assets/icons/line1.png"),
            SizedBox(height: 5,),
            Image.asset("assets/icons/line2.png"),
          ],
        )
        : Column(
          children: [
            AutoSizeText(
                "$title",
                maxLines: 1,
                maxFontSize: 16,
                minFontSize: 16,
                overflow: TextOverflow.ellipsis,
                style: AppTheme.globalFont(TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 16,
                    color: LightColor.textGrey)),
              ),
              SizedBox(height: 10,),
          ],
        );
  }
}
