import 'package:book_medial/theme/theme.dart';
import 'package:book_medial/utils/routes.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'core/locator.dart';
import 'core/providers.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'core/services/navigator_service.dart';

void main() async {
  await LocatorInjector.setupLocator();
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MainApplication());
}

class MainApplication extends StatefulWidget {
  @override
  _MainApplicationState createState() => _MainApplicationState();
}

class _MainApplicationState extends State<MainApplication> {
  void initializeFlutterFire() async {
    try {
      // Wait for Firebase to initialize and set `_initialized` state to true
      await Firebase.initializeApp();
      print("Firebase initializeapp succès");
    } catch (e) {
      // Set `_error` state to true if Firebase initialization fails
      print("Firebase initializeapp error");
      print(e);
    }
  }

  @override
  void initState() {
    initializeFlutterFire();
    super.initState();
    // Rotation d'écran
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    // Gestion Status Barre état full-Screen
    //WidgetsFlutterBinding.ensureInitialized();
    SystemChrome.setEnabledSystemUIOverlays(
        [SystemUiOverlay.bottom, SystemUiOverlay.top]);
    SystemChrome.setEnabledSystemUIOverlays([]);
    // Gestion Status Barre état no full-Screen
    // SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: ProviderInjector.providers,
      child: MaterialApp(
        localizationsDelegates: [GlobalMaterialLocalizations.delegate],
        supportedLocales: [const Locale('en'), const Locale('fr')],
        theme: AppTheme.lightTheme,
        //routes: routes,
        initialRoute: "/",
        debugShowCheckedModeBanner: false,
        navigatorKey: locator<NavigatorService>().navigatorKey,
        onGenerateRoute: onGenerateRouteFunc,
      ),
    );
  }

  @override
  dispose() {
    // Rotation d'écran
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    super.dispose();
  }
}
