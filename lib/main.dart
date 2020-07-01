import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'Routemanager/routemanager.dart';


void main() {
  Routes.createRoutes();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom]);
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp,DeviceOrientation.portraitDown]);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Color(0xff385170),
        canvasColor:  Color(0xff9FD3C7),
        primaryColorDark: Color(0xff142D4C),
        fontFamily: "balsamiq",
        textTheme: TextTheme(
          body1: TextStyle(color: Color(0xff385170), fontSize: 48),
          body2: TextStyle(color: Color(0xff385170), fontSize: 24),
          display1: TextStyle(color: Color(0xffF9F8EB), fontSize: 30),
          display2: TextStyle(color: Color(0xffF9F8EB), fontSize: 22),
        ),
      ),
      initialRoute: "/menu",
      onGenerateRoute: Routes.sailor.generator(),
      navigatorKey: Routes.sailor.navigatorKey,
    );
  }
}
