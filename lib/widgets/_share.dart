import 'package:auto_size_text/auto_size_text.dart';
import 'package:book_medial/core/models/propertie_models.dart';
import 'package:book_medial/theme/light_color.dart';
import 'package:book_medial/theme/theme.dart';
import 'package:book_medial/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class ShareWidget {
  static Widget button(
      {required BuildContext context,
      double? width,
      double borderWidth = 1.0,
      Color backgoundColor = const Color(0xffffffff),
      Color borderColor = const Color(0xffffffff),
      Color textColor = const Color(0xffffffff),
      String? title,
      double fontSize = 14,
      double height = 40.0,
      double borderRadius = 10.0,
      double margin = 60}) {
    return Container(
      margin: EdgeInsets.only(left: margin, right: margin),
      width: width,
      height: height,
      child: Center(
        child: AutoSizeText(
          "$title",
          style: AppTheme.globalFont(TextStyle(
            fontSize: fontSize,
            color: textColor,
            fontWeight: FontWeight.w700,
          )),
          textAlign: TextAlign.center,
        ),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius),
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

  static Widget buttonIcone(
      {required BuildContext context,
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
      double blurRadius = 5}) {
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
          BoxShadow(color: shadowColors, offset: offset, blurRadius: blurRadius)
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
      padding: EdgeInsets.only(right: 20),
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
          Expanded(
            child: AutoSizeText(
              "$text1",
              maxLines: 1,
              maxFontSize: 18,
              minFontSize: 18,
              overflow: TextOverflow.ellipsis,
              style: AppTheme.globalFont(TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: const Color(0xff313450),
              )),
            ),
          ),
        ],
      ),
    );
  }

  static Widget headerStyle3({
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
                child: Image.asset("assets/icons/close.png")),
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
      TextStyle? labelStyle =
          const TextStyle(fontWeight: FontWeight.w700, fontSize: 14),
      String? hintText = "",
      String? initialValue,
      int maxLines = 1,
      Widget rightLabel = const Text(""),
      Widget? suffixIcon,
      Widget? prefixIcon,
      double fontSize = 14,
      bool obscureText = false,
      bool showPassword = false,
      bool enabled = true,
      Color backgroundColors = const Color(0xffF6F6F6),
      Color borderColor = const Color(0xffDFDBDB),
      double borderWidth = 1.0,
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
                style: AppTheme.globalFont(labelStyle),
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
                  initialValue: initialValue,
                  name: name,
                  enabled: enabled,
                  obscureText: obscureText,
                  maxLines: maxLines,
                  style: AppTheme.globalFont(TextStyle(
                    fontSize: fontSize,
                  )),
                  decoration: InputDecoration(
                      suffixIcon: suffixIcon,
                      prefixIcon: prefixIcon,
                      contentPadding:
                          EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
                      hintText: hintText,
                      hintStyle: AppTheme.globalFont(
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
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
              color: backgroundColors,
              border: Border.all(width: borderWidth, color: borderColor),
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

  static Widget boxMain(
      {Widget? body,
      EdgeInsets? margin = const EdgeInsets.only(top: 10),
      EdgeInsets? padding = const EdgeInsets.all(15),
      double borderRadius = 20.0,
      Color backgroundColor = const Color(0xffffffff),
      Color shadowColor = const Color(0x17000000),
      Offset shadowOfset = const Offset(0, 5),
      double blurRadius = 20}) {
    return Container(
      // width: width,
      // height: height,
      margin: margin,
      padding: padding,
      //height: 456.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius),
        color: backgroundColor,
        boxShadow: [
          BoxShadow(
              color: shadowColor, offset: shadowOfset, blurRadius: blurRadius)
        ],
      ),
      child: body,
    );
  }

  static Widget boxRoom({
    required BuildContext context,
    data,
    FreeRoom? freeRoom,
    Property? property,
    String? route,
    onPressed,
    //Widget? body,
    EdgeInsets? margin = const EdgeInsets.only(top: 10),
    EdgeInsets? padding = const EdgeInsets.all(15),
  }) {
    String facilities = '';
    if (property?.facilities != null) {
      List<Facility> fac = property?.facilities as List<Facility>;
      for (var i = 0; i < fac.length; i++) {
        facilities += "${fac[i].name}";
        if (i + 1 < fac.length) {
          facilities += " - ";
        }
      }
    }

    return Container(
      // width: width,
      // height: height,
      margin: margin,
      padding: padding,
      //height: 456.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18.0),
        color: const Color(0xffFFFCE2),
        boxShadow: [
          BoxShadow(
              color: const Color(0x38000000),
              offset: Offset(0, 6),
              blurRadius: 5)
        ],
      ),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                flex: 3,
                child: AutoSizeText(
                  "${(freeRoom?.name != null) ? freeRoom?.name : ''}",
                  maxLines: 1,
                  maxFontSize: 20,
                  minFontSize: 20,
                  overflow: TextOverflow.ellipsis,
                  style: AppTheme.globalFont(
                      TextStyle(fontWeight: FontWeight.w700, fontSize: 20)),
                ),
              ),
              Expanded(
                  flex: 1,
                  child: RatingBarIndicator(
                    rating: 5,
                    itemSize: 19,
                    direction: Axis.horizontal,
                    itemCount: 5,
                    itemPadding: EdgeInsets.symmetric(horizontal: 0.0),
                    itemBuilder: (context, _) => Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                  ))
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Container(
                width: 30,
                height: 20,
                child: Image.asset("assets/icons/valide.png"),
              ),
              Expanded(
                child: Container(
                  margin: EdgeInsets.only(left: 5),
                  child: AutoSizeText(
                    "$facilities",
                    maxLines: 2,
                    maxFontSize: 10,
                    minFontSize: 10,
                    overflow: TextOverflow.ellipsis,
                    style: AppTheme.globalFont(TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 10,
                        color: Color(0xffFBBB00))),
                  ),
                ),
              )
            ],
          ),
          Row(
            children: [
              Container(
                width: 30,
                height: 20,
                child: Image.asset("assets/icons/bed.png"),
              ),
              Expanded(
                child: Container(
                  margin: EdgeInsets.only(left: 5),
                  child: AutoSizeText(
                    "${(freeRoom?.beds?.first.type != null) ? freeRoom?.beds?.first.type : ''}",
                    maxLines: 1,
                    maxFontSize: 10,
                    minFontSize: 10,
                    overflow: TextOverflow.ellipsis,
                    style: AppTheme.globalFont(TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 10,
                        color: Color(0xffFBBB00))),
                  ),
                ),
              )
            ],
          ),
          Row(
            children: [
              Container(
                width: 30,
                height: 20,
                child: Image.asset("assets/icons/personnes.png"),
              ),
              Container(
                margin: EdgeInsets.only(left: 5),
                child: AutoSizeText(
                  "${(freeRoom?.guests_number != null) ? freeRoom?.guests_number : '---'} personnes",
                  maxLines: 1,
                  maxFontSize: 10,
                  minFontSize: 10,
                  overflow: TextOverflow.ellipsis,
                  style: AppTheme.globalFont(TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 10,
                      color: Color(0xffFBBB00))),
                ),
              )
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Expanded(
                  child: Container(
                margin: EdgeInsets.only(left: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AutoSizeText(
                      "Tarifs nuit",
                      maxLines: 1,
                      maxFontSize: 14,
                      minFontSize: 14,
                      overflow: TextOverflow.ellipsis,
                      style: AppTheme.globalFont(TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 14,
                          color: Colors.black)),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    AutoSizeText(
                      "",
                      maxLines: 1,
                      maxFontSize: 14,
                      minFontSize: 14,
                      overflow: TextOverflow.ellipsis,
                      style: AppTheme.globalFont(TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                          color: Color(0xffFBBB00))),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    AutoSizeText(
                      "${(freeRoom?.price_per_night != null) ? freeRoom?.price_per_night : 0} Fcfa",
                      maxLines: 1,
                      maxFontSize: 18,
                      minFontSize: 18,
                      overflow: TextOverflow.ellipsis,
                      style: AppTheme.globalFont(TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 18,
                          color: Color(0xffFBBB00))),
                    ),
                  ],
                ),
              )),
              Expanded(
                  child: Container(
                margin: EdgeInsets.only(right: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AutoSizeText(
                      "Tarifs jour",
                      maxLines: 1,
                      maxFontSize: 14,
                      minFontSize: 14,
                      overflow: TextOverflow.ellipsis,
                      style: AppTheme.globalFont(TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 14,
                          color: Colors.black)),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    AutoSizeText(
                      "",
                      maxLines: 1,
                      maxFontSize: 14,
                      minFontSize: 14,
                      overflow: TextOverflow.ellipsis,
                      style: AppTheme.globalFont(TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                          color: Color(0xffFBBB00))),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    AutoSizeText(
                      "${(freeRoom?.price_per_day != null) ? freeRoom?.price_per_day : 0} Fcfa",
                      maxLines: 1,
                      maxFontSize: 18,
                      minFontSize: 18,
                      overflow: TextOverflow.ellipsis,
                      style: AppTheme.globalFont(TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 18,
                          color: Color(0xffFBBB00))),
                    ),
                  ],
                ),
              ))
            ],
          ),
          if (route != null)
            Container(
              margin: EdgeInsets.only(top: 20),
              child: TextButton(
                onPressed: onPressed,
                child: ShareWidget.button(
                  context: context,
                  backgoundColor: LightColor.primary,
                  title: "Je Reserve",
                  margin: 0,
                ),
              ),
            )
        ],
      ),
    );
  }

  static Widget boxRoom1({
    required BuildContext context,
    data,
    Property? property,
    String? route,
    onPressed,
    //Widget? body,
    EdgeInsets? margin = const EdgeInsets.only(top: 10),
    EdgeInsets? padding = const EdgeInsets.all(15),
  }) {
    String facilities = '';
    if (property?.facilities != null) {
      List<Facility> fac = property?.facilities as List<Facility>;
      for (var i = 0; i < fac.length; i++) {
        facilities += "${fac[i].name}";
        if (i + 1 < fac.length) {
          facilities += " - ";
        }
      }
    }

    return Container(
      // width: width,
      // height: height,
      margin: margin,
      padding: padding,
      //height: 456.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18.0),
        color: const Color(0xffFFFCE2),
        boxShadow: [
          BoxShadow(
              color: const Color(0x38000000),
              offset: Offset(0, 6),
              blurRadius: 5)
        ],
      ),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                flex: 3,
                child: AutoSizeText(
                  "${(property?.name != null) ? property?.name : ''}",
                  maxLines: 1,
                  maxFontSize: 20,
                  minFontSize: 20,
                  overflow: TextOverflow.ellipsis,
                  style: AppTheme.globalFont(
                      TextStyle(fontWeight: FontWeight.w700, fontSize: 20)),
                ),
              ),
              Expanded(
                  flex: 1,
                  child: RatingBarIndicator(
                    rating: 5,
                    itemSize: 19,
                    direction: Axis.horizontal,
                    itemCount: 5,
                    itemPadding: EdgeInsets.symmetric(horizontal: 0.0),
                    itemBuilder: (context, _) => Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                  ))
            ],
          ),
          SizedBox(
            height: 10,
          ),
          // Container(
          //   margin: EdgeInsets.only(left: 0),
          //   child: AutoSizeText(
          //     "${(property?.description != null) ? property?.description : ''}",
          //     maxLines: 2,
          //     maxFontSize: 10,
          //     minFontSize: 10,
          //     overflow: TextOverflow.ellipsis,
          //     style: AppTheme.globalFont(TextStyle(
          //       fontWeight: FontWeight.w400,
          //       fontSize: 10,
          //     )),
          //   ),
          // ),
          // SizedBox(
          //   height: 10,
          // ),
          Row(
            children: [
              Container(
                width: 30,
                height: 20,
                child: Image.asset("assets/icons/valide.png"),
              ),
              Expanded(
                child: Container(
                  margin: EdgeInsets.only(left: 5),
                  child: AutoSizeText(
                    "$facilities",
                    maxLines: 2,
                    maxFontSize: 10,
                    minFontSize: 10,
                    overflow: TextOverflow.ellipsis,
                    style: AppTheme.globalFont(TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 10,
                        color: Color(0xffFBBB00))),
                  ),
                ),
              )
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Expanded(
                  child: Container(
                margin: EdgeInsets.only(left: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AutoSizeText(
                      "Tarifs nuit",
                      maxLines: 1,
                      maxFontSize: 14,
                      minFontSize: 14,
                      overflow: TextOverflow.ellipsis,
                      style: AppTheme.globalFont(TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 14,
                          color: Colors.black)),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    AutoSizeText(
                      "",
                      maxLines: 1,
                      maxFontSize: 14,
                      minFontSize: 14,
                      overflow: TextOverflow.ellipsis,
                      style: AppTheme.globalFont(TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                          color: Color(0xffFBBB00))),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    AutoSizeText(
                      "${(property?.price_per_night != null) ? property?.price_per_night : 0} Fcfa",
                      maxLines: 1,
                      maxFontSize: 18,
                      minFontSize: 18,
                      overflow: TextOverflow.ellipsis,
                      style: AppTheme.globalFont(TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 18,
                          color: Color(0xffFBBB00))),
                    ),
                  ],
                ),
              )),
              Expanded(
                  child: Container(
                margin: EdgeInsets.only(right: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AutoSizeText(
                      "Tarifs jour",
                      maxLines: 1,
                      maxFontSize: 14,
                      minFontSize: 14,
                      overflow: TextOverflow.ellipsis,
                      style: AppTheme.globalFont(TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 14,
                          color: Colors.black)),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    AutoSizeText(
                      "",
                      maxLines: 1,
                      maxFontSize: 14,
                      minFontSize: 14,
                      overflow: TextOverflow.ellipsis,
                      style: AppTheme.globalFont(TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                          color: Color(0xffFBBB00))),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    AutoSizeText(
                      "${(property?.price_per_day != null) ? property?.price_per_day : 0} Fcfa",
                      maxLines: 1,
                      maxFontSize: 18,
                      minFontSize: 18,
                      overflow: TextOverflow.ellipsis,
                      style: AppTheme.globalFont(TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 18,
                          color: Color(0xffFBBB00))),
                    ),
                  ],
                ),
              ))
            ],
          ),
          if (route != null)
            Container(
              margin: EdgeInsets.only(top: 20),
              child: TextButton(
                onPressed: onPressed,
                child: ShareWidget.button(
                  context: context,
                  backgoundColor: LightColor.primary,
                  title: "Je Reserve",
                  margin: 0,
                ),
              ),
            )
        ],
      ),
    );
  }

  static Widget boxRoom2({
    required BuildContext context,
    data,
    // String? route,
    //Widget? body,
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
        borderRadius: BorderRadius.circular(18.0),
        color: const Color(0xffFFFCE2),
        boxShadow: [
          BoxShadow(
              color: const Color(0x38000000),
              offset: Offset(0, 6),
              blurRadius: 5)
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AutoSizeText(
            "Sexy Room",
            maxLines: 1,
            maxFontSize: 20,
            minFontSize: 20,
            overflow: TextOverflow.ellipsis,
            style: AppTheme.globalFont(
                TextStyle(fontWeight: FontWeight.w700, fontSize: 20)),
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Container(
                width: 30,
                height: 20,
                child: Image.asset("assets/icons/valide.png"),
              ),
              Container(
                margin: EdgeInsets.only(left: 5),
                child: AutoSizeText(
                  "Climatisation - Ventilation - Wifi - Bar - Piscine",
                  maxLines: 1,
                  maxFontSize: 10,
                  minFontSize: 10,
                  overflow: TextOverflow.ellipsis,
                  style: AppTheme.globalFont(TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 10,
                      color: Color(0xffFBBB00))),
                ),
              )
            ],
          ),
          Row(
            children: [
              Container(
                width: 30,
                height: 20,
                child: Image.asset("assets/icons/bed.png"),
              ),
              Container(
                margin: EdgeInsets.only(left: 5),
                child: AutoSizeText(
                  "Lit simple / Largeur 90 - 130 ",
                  maxLines: 1,
                  maxFontSize: 10,
                  minFontSize: 10,
                  overflow: TextOverflow.ellipsis,
                  style: AppTheme.globalFont(TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 10,
                      color: Color(0xffFBBB00))),
                ),
              )
            ],
          ),
          Row(
            children: [
              Container(
                width: 30,
                height: 20,
                child: Image.asset("assets/icons/personnes.png"),
              ),
              Container(
                margin: EdgeInsets.only(left: 5),
                child: AutoSizeText(
                  "02 personnes",
                  maxLines: 1,
                  maxFontSize: 10,
                  minFontSize: 10,
                  overflow: TextOverflow.ellipsis,
                  style: AppTheme.globalFont(TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 10,
                      color: Color(0xffFBBB00))),
                ),
              )
            ],
          ),
          SizedBox(
            height: 10,
          ),
          AutoSizeText.rich(
            TextSpan(
                style: AppTheme.globalFont(
                    TextStyle(fontSize: 18, fontWeight: FontWeight.w700)),
                children: [
                  TextSpan(
                      text: "Tarif du séjour :   ",
                      style: TextStyle(fontSize: 14)),
                  TextSpan(
                      text: "42000 Fcfa",
                      style: TextStyle(
                        color: Color(0xffFBBB00),
                      ))
                ]),
            maxFontSize: 18,
            maxLines: 1,
            minFontSize: 18,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
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

  static Widget box2(
      {Widget? body,
      String? labelText,
      TextStyle labelStyle =
          const TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
      double? width,
      Color backgroundColors = const Color(0xffF6F6F6),
      Color borderColors = const Color(0xffDFDBDB),
      double borderWidth = 1.0,
      double borderRadius = 20,
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
              style: AppTheme.globalFont(labelStyle),
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Container(
            width: width,
            padding: padding,
            child: body,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(borderRadius),
              color: backgroundColors,
              border: Border.all(width: borderWidth, color: borderColors),
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

  static Widget box3(
      {Widget? body,
      TextStyle labelStyle =
          const TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
      double? width,
      Color backgroundColors = const Color(0xffF6F6F6),
      Color borderColors = const Color(0xffDFDBDB),
      double borderWidth = 1.0,
      double borderRadius = 20,
      EdgeInsets? padding = const EdgeInsets.all(10)}) {
    return Container(
      width: width,
      padding: padding,
      child: body,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(borderRadius),
            topRight: Radius.circular(borderRadius)),
        color: backgroundColors,
        border: Border(
            top: BorderSide(width: borderWidth, color: borderColors),
            left: BorderSide(width: borderWidth, color: borderColors),
            right: BorderSide(width: borderWidth, color: borderColors)),
        // boxShadow: [
        //   BoxShadow(
        //       color: const Color(0x0d000000),
        //       offset: Offset(0, 2),
        //       blurRadius: 5)
        // ],
      ),
    );
  }

  static Widget boxReservationn1(
      {required BuildContext context,
      required Widget body,
      Color backgroundColor = const Color(0xFFF6F6F6),
      required String labelText}) {
    return ShareWidget.boxMain(
        borderRadius: 11,
        backgroundColor: backgroundColor ,
        padding: EdgeInsets.all(20),
        shadowOfset: Offset(0, 0),
        blurRadius: 0,
        body: Container(
          width: AppTheme.fullWidth(context),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AutoSizeText(
                "$labelText",
                maxLines: 2,
                maxFontSize: 18,
                minFontSize: 18,
                overflow: TextOverflow.ellipsis,
                style: AppTheme.globalFont(
                    TextStyle(fontWeight: FontWeight.w600, fontSize: 18)),
              ),
              SizedBox(
                height: 20,
              ),
              body,
            ],
          ),
        ));
  }

  static Widget boxHotel1({
    required BuildContext context,
    dynamic param,
    String? route,
    String? name,
    String? location,
    String? image,
    double? width = 50.0,
    double height = 50.0,
    dynamic onTap,
    EdgeInsets? margin = const EdgeInsets.all(0),
    EdgeInsets? padding = const EdgeInsets.all(0),
  }) {
    if (image == null || image.isEmpty) image = Constant.defaultImage;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        height: height,
        margin: margin,
        padding: padding,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          color: Colors.grey[300],
          image: DecorationImage(
            image: NetworkImage(image),
            fit: BoxFit.cover,
          ),
          boxShadow: [
            BoxShadow(
                color: Colors.black26, offset: Offset(0, 4), blurRadius: 10)
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
                  Color.fromARGB(50, 0, 0, 0),
                  Color.fromARGB(20, 0, 0, 0),
                  Color.fromARGB(5, 0, 0, 0),
                  Color.fromARGB(0, 0, 0, 0),
                  Color.fromARGB(0, 0, 0, 0),
                ],
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
              ),
            ),
            padding: EdgeInsets.only(
              left: 20,
              bottom: 20,
              right: 20,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                AutoSizeText(
                  "$name",
                  maxFontSize: 16,
                  minFontSize: 16,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: AppTheme.globalFont(TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                      fontWeight: FontWeight.w600)),
                ),
                SizedBox(
                  height: 0,
                ),
                Row(
                  children: [
                    Expanded(
                        flex: 1,
                        child: Image.asset("assets/icons/location.png")),
                    SizedBox(
                      width: 5,
                    ),
                    Expanded(
                      flex: 9,
                      child: AutoSizeText(
                        "$location",
                        maxFontSize: 14,
                        minFontSize: 14,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: AppTheme.globalFont(TextStyle(
                            fontSize: 14,
                            color: Colors.white,
                            fontWeight: FontWeight.w400)),
                      ),
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
          BoxShadow(color: Colors.black26, offset: Offset(0, 4), blurRadius: 10)
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
              SizedBox(
                height: 5,
              ),
              Image.asset("assets/icons/line1.png"),
              SizedBox(
                height: 5,
              ),
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
              SizedBox(
                height: 10,
              ),
            ],
          );
  }
}
