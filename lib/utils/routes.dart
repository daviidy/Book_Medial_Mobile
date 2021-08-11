import 'package:book_medial/views/forget_password/step_one/step_one_view.dart';
import 'package:book_medial/views/forget_password/step_three/step_three_view.dart';
import 'package:book_medial/views/forget_password/step_two/step_two_view.dart';
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
  '/forget-password/step1': (BuildContext context) => new StepOneView(),
  '/forget-password/step2': (BuildContext context) => new StepTwoView(),
  '/forget-password/step3': (BuildContext context) => new StepThreeView(),
};
