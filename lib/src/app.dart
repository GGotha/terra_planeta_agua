import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:terra_planeta_agua/src/ui/screens/about_screen.dart';
import 'package:terra_planeta_agua/src/ui/screens/report_details.dart';
import 'package:terra_planeta_agua/src/ui/screens/report_screen.dart';
import 'package:terra_planeta_agua/src/ui/screens/login_screen.dart';
import 'package:terra_planeta_agua/src/ui/screens/splash_screen.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarBrightness: Brightness.dark,
        statusBarColor: Colors.black,
        systemNavigationBarColor: Colors.black,
      ),
    );

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    return MaterialApp(
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      debugShowCheckedModeBanner: false,
      initialRoute: "/",
      title: 'Terra, planeta Água',
      supportedLocales: [const Locale('pt', 'BR')],
      routes: {
        '/': (context) => SplashScreen(),
        '/login': (context) => LoginScreen(),
        '/report-screen': (context) => ReportScreen(),
        '/report-details': (context) => ReportDetails(),
        '/about': (context) => AboutScreen(),
      },
    );
  }
}
