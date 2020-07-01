import 'package:flutter/material.dart';
import 'package:nummer/Routemanager/routemanager.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CustomButton extends StatefulWidget {
  String textContent;
  String buttonType;
  String path;

  CustomButton(this.textContent, this.buttonType, this.path);

  @override
  _CustomButtonState createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  bool hasBeenPressed = false;
  bool isPath;
  bool isLanguage;
  String languageSelected;
  List<String> possiblePath = [
    "/",
    "/game",
    "/howToPlay",
    "/selectLanguage",
    "/selectDifficulty"
  ];

  List<String> possibleLanguage = [
    "en-US",
    "DE",
    "ES",
    "FR",
    "pt-BR",
    "IT",
    "DA",
    "SV",
    "NO",
    "NL",
    "ar-EG",
    "FA",
    "HI",
    "UR",
    "BN",
    "ID",
    "zh-CN",
    "TH",
    "JA",
    "KO",
    "RU",
    "PL",
    "HU",
    "CS",
    "SR",
    "SK",
    "UK",
    "TR",
    "EL",
    "RO",

    "LA",
    "TA",
    "CY",
    "SQ",
    "ET",
    "FI",
    "KU",
    "HR",
    "SW", //not
    "CA",
  ];

  addLanguageToSP() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('language', widget.path);
  }

  Future<void> getLanguageFromSharedPref() async {
    final prefs = await SharedPreferences.getInstance();
    languageSelected = prefs.getString('language');
  }

  double boxHeight, boxWidth, containerHeight, boxRadius;
  TextStyle boxFont;

  @override
  Widget build(BuildContext context) {
    switch (widget.buttonType) {
      case "small":
        boxHeight = 44;
        containerHeight = 51;
        boxWidth = 133;
        boxRadius = 15;
        boxFont = Theme.of(context).textTheme.display2;
        break;

      case "medium":
        boxHeight = 63;
        containerHeight = 70;
        boxWidth = 208;
        boxRadius = 20;
        boxFont = Theme.of(context).textTheme.display1;
        break;

      case "large":
        boxHeight = 63;
        containerHeight = 70;
        boxWidth = 300;
        boxRadius = 20;
        boxFont = Theme.of(context).textTheme.display1;
        break;
    }
    return Container(
      margin: EdgeInsets.all(5),
      height: containerHeight,
      width: boxWidth,
      child: Stack(children: <Widget>[
        AnimatedPositioned(
          duration: Duration(milliseconds: 50),
          top: hasBeenPressed ? 7 : 0,
          child: GestureDetector(
            onTap: () {
              possiblePath.contains(widget.path)
                  ? isPath = true
                  : isPath = false;

              possibleLanguage.contains(widget.path)
                  ? isLanguage = true
                  : isLanguage = false;

              setState(() {
                Future.delayed(const Duration(milliseconds: 100), () {
                  if (isPath) {
                    if (widget.path == "/game") {
                      switch (widget.textContent) {
                        case "Easy":
                          Routes.sailor.navigate<bool>(
                            "/game",
                            params: {
                              'difficulty': 99,
                            },
                          );

                          break;
                        case "Normal":
                          Routes.sailor.navigate<bool>(
                            "/game",
                            params: {
                              'difficulty': 999,
                            },
                          );
                          break;
                        case "Hard":
                          Routes.sailor.navigate<bool>(
                            "/game",
                            params: {
                              'difficulty': 9999,
                            },
                          );
                          break;
                        case "Extreme":
                          Routes.sailor.navigate<bool>(
                            "/game",
                            params: {
                              'difficulty': 999999,
                            },
                          );
                          break;
                      }
                    } else {
                      Routes.sailor.navigate(widget.path);
                    }
                  }

                  if (isLanguage) {
                    addLanguageToSP();

                    Routes.sailor.navigate("/selectDifficulty");
                  }
                  if (!isPath && !isLanguage) {
                    Routes.sailor.navigate(widget.path);
                  }
                });
              });
            },
            onTapDown: (x) {
              setState(() {
                hasBeenPressed = true;
              });
            },
            onTapUp: (x) {
              Future.delayed(const Duration(milliseconds: 200), () {
                setState(() {
                  hasBeenPressed = false;
                });
              });
            },
            onTapCancel: () {
              Future.delayed(const Duration(milliseconds: 200), () {
                setState(() {
                  hasBeenPressed = false;
                });
              });
            },
            child: AnimatedContainer(
              duration: Duration(milliseconds: 50),
              width: boxWidth,
              height: boxHeight,
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.circular(boxRadius),
                boxShadow: [
                  BoxShadow(
                    color: Theme.of(context).primaryColorDark,
                    offset: Offset(0, hasBeenPressed ? 0 : 7),
                  ),
                ],
              ),
              child: Center(
                child: Text(
                  widget.textContent,
                  style: boxFont,
                ),
              ),
            ),
          ),
        ),
      ]),
    );
  }
}
