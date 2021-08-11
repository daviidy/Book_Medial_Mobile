import 'package:auto_size_text/auto_size_text.dart';
import 'package:book_medial/theme/theme.dart';
import 'package:flutter/material.dart';

class ShareWidget {
  static Widget button(
      {required BuildContext context,
      double? width,
      double borderWidth = 1.0,
      Color backgoundColor = const Color(0xffffffff),
      Color borderColor = const Color(0xffffffff),
      Color textColor = const Color(0xffffffff),
      String? title,
      double margin = 60}) {
    return Container(
      margin: EdgeInsets.only(left: margin, right: margin),
      width: width,
      height: 40.0,
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
            onPressed: () => Navigator.pushNamed(context, "$route"),
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
}
