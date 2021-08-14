import 'package:book_medial/core/services/database_service.dart';
import 'package:book_medial/views/home/home_view.dart';
import 'package:flutter/material.dart';

class BottomMenuWidget {
  static final DatabaseService storage = new DatabaseService();

  static Widget home({required BuildContext context, bool disable = false}) {
    return Container(
      height: 80,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.0), topRight: Radius.circular(20.0)),
        color: Color(0xffFAFCFF),
        boxShadow: [
          BoxShadow(
              color: const Color(0x17000000),
              offset: Offset(0, -5),
              blurRadius: 20)
        ],
      ),
      child: Row(
        children: [
          Expanded(
              child: Container(
                  child: TextButton(
                      onPressed: () async => (disable)
                          ? null
                          : Navigator.pushNamed(context, "/home"),
                      child: Image.asset("assets/icons/home-active.png")))),
          Expanded(
              child: Container(
                  child: TextButton(
                      onPressed: () => null,
                      child: Image.asset("assets/icons/notification.png")))),
          Expanded(
              child: Container(
                  child: TextButton(
                      onPressed: () async => (await storage.getItem("isLogin"))
                          ? Navigator.pushNamed(context, "/compte")
                          : Navigator.pushNamed(context, "/login"),
                      child: Image.asset("assets/icons/profile.png")))),
        ],
      ),
    );
  }

  static Widget notification(
      {required BuildContext context, bool disable = false}) {
    return Container(
      height: 80,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.0), topRight: Radius.circular(20.0)),
        color: Color(0xffFAFCFF),
        boxShadow: [
          BoxShadow(
              color: const Color(0x17000000),
              offset: Offset(0, -5),
              blurRadius: 20)
        ],
      ),
      child: Row(
        children: [
          Expanded(
              child: Container(
                  child: TextButton(
                      onPressed: () => Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                              builder: (BuildContext context) => HomeView(),
                            ),
                            (route) => false,
                          ),
                      child: Image.asset("assets/icons/home.png")))),
          Expanded(
              child: Container(
                  child: TextButton(
                      onPressed: () => (disable) ? null : null,
                      child: Image.asset(
                          "assets/icons/notification-active.png")))),
          Expanded(
              child: Container(
                  child: TextButton(
                      onPressed: () async => (await storage.getItem("isLogin"))
                          ? Navigator.pushNamed(context, "/compte")
                          : Navigator.pushNamed(context, "/login"),
                      child: Image.asset("assets/icons/profile.png")))),
        ],
      ),
    );
  }

  static Widget profil({required BuildContext context, bool disable = false}) {
    return Container(
      height: 80,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.0), topRight: Radius.circular(20.0)),
        color: Color(0xffFAFCFF),
        boxShadow: [
          BoxShadow(
              color: const Color(0x17000000),
              offset: Offset(0, -5),
              blurRadius: 20)
        ],
      ),
      child: Row(
        children: [
          Expanded(
              child: Container(
                  child: TextButton(
                      onPressed: () => Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                              builder: (BuildContext context) => HomeView(),
                            ),
                            (route) => false,
                          ),
                      child: Image.asset("assets/icons/home.png")))),
          Expanded(
              child: Container(
                  child: TextButton(
                      onPressed: () => null,
                      child: Image.asset("assets/icons/notification.png")))),
          Expanded(
              child: Container(
                  child: TextButton(
                      onPressed: () => (disable)
                          ? null
                          : Navigator.pushNamed(context, "/compte"),
                      child: Image.asset("assets/icons/profile-active.png")))),
        ],
      ),
    );
  }
}
