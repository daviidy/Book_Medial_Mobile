import 'package:book_medial/views/home/home_view.dart';
import 'package:book_medial/views/intro/intro_view.dart';
import 'package:book_medial/views/login/login_view.dart';
import 'package:book_medial/views/register/register_view.dart';
import 'package:flutter/material.dart';

final routes = {
  '/': (BuildContext context) => new IntroView(),
  '/login': (BuildContext context) => new LoginView(),
  '/register': (BuildContext context) => new RegisterView(),
  '/home': (BuildContext context) => new HomeView(),
};
