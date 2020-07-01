import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../Screens/menu.dart';
import '../Screens/howtoplay.dart';
import '../Screens/selectdifficulty.dart';
import '../Screens/selectlanguage.dart';
import '../Screens/game.dart';
import 'package:sailor/sailor.dart';



class Routes {
  static const List<String> routesNames = [
    "/menu",
    "/selectLanguage",
    "/selectDifficulty",
    "/game",
    "/howToPlay",
  ];

  static final sailor = Sailor(options: SailorOptions(
    defaultTransitions: [SailorTransition.fade_in],
    defaultTransitionCurve: Curves.decelerate,
    defaultTransitionDuration: Duration(milliseconds: 300),
  ),);



  static void createRoutes() {

    sailor.addRoutes([
     
      SailorRoute(
          name: routesNames[0],

          builder: (context, args, params) {
            return Menu();
          }),
      SailorRoute(
          name: routesNames[1],

          builder: (context, args, params) {
            return SelectLanguage();
          }),
      SailorRoute(
          name: routesNames[2],

          builder: (context, args, params) {
            return SelectDifficulty();
          }),
      SailorRoute(
          name: routesNames[3],

          builder: (context, args, params) {
            final difficulty = params.param<int>('difficulty');
            return Game();
          },
          params: [
            SailorParam(
              name: 'difficulty',
              defaultValue: 100,
            ),
          ],
          ),
      SailorRoute(
          name: routesNames[4],
          builder: (context, args, params) {
            return HowToPlay();
          }),
    ]);



  }
}
