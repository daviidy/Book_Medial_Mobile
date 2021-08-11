import 'package:auto_size_text/auto_size_text.dart';
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
    EdgeInsets padding = const EdgeInsets.all(0),
    EdgeInsets margin = const EdgeInsets.all(0),
  }) {
    return Container(
      margin: margin,
      padding: padding,
      //width: width,
      height: height,
      child: Center(child: body),
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
              border: Border.all(width: 1.0, color: const Color(0xffE9E9E9)),
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
}
