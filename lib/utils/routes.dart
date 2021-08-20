import 'package:book_medial/views/compte/compte_view.dart';
import 'package:book_medial/views/compte_info/compte_info_view.dart';
import 'package:book_medial/views/forget_password/step_one/step_one_view.dart';
import 'package:book_medial/views/forget_password/step_three/step_three_view.dart';
import 'package:book_medial/views/forget_password/step_two/step_two_view.dart';
import 'package:book_medial/views/home/home_view.dart';
import 'package:book_medial/views/intro/intro_view.dart';
import 'package:book_medial/views/login/login_view.dart';
import 'package:book_medial/views/notify/notify_view.dart';
import 'package:book_medial/views/notify_reserv/notify_reserv_view.dart';
import 'package:book_medial/views/register/register_view.dart';
import 'package:book_medial/views/room/room_view.dart';
import 'package:book_medial/views/room_disponible/room_disponible_view.dart';
import 'package:book_medial/views/room_paiement/room_paiement_view.dart';
import 'package:book_medial/views/room_reservation/room_reservation_view.dart';
import 'package:book_medial/views/voir_plus/voir_plus_view.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

final routes = {
  '/': (BuildContext context) => new IntroView(),
  '/login': (BuildContext context) => new LoginView(),
  '/register': (BuildContext context) => new RegisterView(),
  '/home': (BuildContext context) => new HomeView(),
  '/voir-plus': (BuildContext context) => new VoirPlusView(),
  '/room': (BuildContext context) => new RoomView(),
  '/room-disponible': (BuildContext context) => new RoomDisponibleView(),
  '/room-reservation': (BuildContext context) => new RoomReservationView(),
  '/compte': (BuildContext context) => new CompteView(),
  '/compte-info': (BuildContext context) => new CompteInfoView(),
  '/notification': (BuildContext context) => new NotifyView(),
  '/forget-password/step1': (BuildContext context) => new StepOneView(),
  '/forget-password/step2': (BuildContext context) => new StepTwoView(),
  '/forget-password/step3': (BuildContext context) => new StepThreeView(),
};


Route<dynamic>? onGenerateRouteFunc(RouteSettings settings) {
  switch (settings.name) {
    case '/': return PageTransition( child: IntroView(),type: PageTransitionType.fade,settings: settings,);
    case '/login': return PageTransition( child: LoginView(),type: PageTransitionType.fade,settings: settings,);
    case '/register': return PageTransition( child: RegisterView(),type: PageTransitionType.fade,settings: settings,);
    case '/forget-password/step1': return PageTransition( child: StepOneView(),type: PageTransitionType.fade,settings: settings,);
    case '/forget-password/step2': return PageTransition( child: StepTwoView(),type: PageTransitionType.fade,settings: settings,);
    case '/forget-password/step3': return PageTransition( child: StepThreeView(),type: PageTransitionType.fade,settings: settings,);

    case '/home': return PageTransition( child: HomeView(),type: PageTransitionType.fade,settings: settings,);
    case '/voir-plus': return PageTransition( child: VoirPlusView(),type: PageTransitionType.fade,settings: settings,);
    case '/room': return PageTransition( child: RoomView(),type: PageTransitionType.fade,settings: settings,);
    case '/room-disponible': return PageTransition( child: RoomDisponibleView(),type: PageTransitionType.fade,settings: settings,);
    case '/room-reservation': return PageTransition( child: RoomReservationView(),type: PageTransitionType.fade,settings: settings,);
    case '/room-paiement': return PageTransition( child: RoomPaiementView(),type: PageTransitionType.fade,settings: settings,);

    case '/compte': return PageTransition( child: CompteView(),type: PageTransitionType.fade,settings: settings,);
    case '/compte-info': return PageTransition( child: CompteInfoView(),type: PageTransitionType.fade,settings: settings,);
    
    case '/notification': return PageTransition( child: NotifyView(),type: PageTransitionType.fade,settings: settings,);
    case '/notification-reservation': return PageTransition( child: NotifyReservView(),type: PageTransitionType.fade,settings: settings,);
    default:
      return null;
  }
}
