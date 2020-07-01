import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:nummer/components/SimpleComponents.dart';
import 'package:nummer/components/CustomButton.dart';

class SelectLanguage extends StatefulWidget {
  @override
  _SelectLanguageState createState() => _SelectLanguageState();
}

class _SelectLanguageState extends State<SelectLanguage> {
  int i = 0;
  bool hasBeenPressed1 = false;
  bool hasBeenPressed2 = false;

  List<dynamic> languagesList = [
    [
      "English",
      "German",
      "Spanish",
      "French",
      "Portuguese",
      "Italian",
      "Latin",
      "Catalan",
      "Romanian",
      "Dutch",
    ],
    [
      "Arabic",
      "Persian",
      "Hindi",
      "Urdu",
      "Bengali",
      "Tamil",
      "Mandarim",
      "Thai",
      "Japanese",
      "Korean",
    ],
    [
      "Russian",
      "Polish",
      "Hungarian",
      "Czech",
      "Serbian",
      "Slovak",
      "Ukrainian",
      "Turkish",
      "Kurdish",
      "Croatian",
    ],
    [
      "Danish",
      "Swedish",
      "Norwegian",
      "Estonian",
      "Finnish",
      "Indonesian",
      "Welsh",
      "Albanian",
      "Greek",
      "Swahili",
    ],
  ];

  List<dynamic> languagesIsoList = [
    [
      "en-US",
      "DE",
      "ES",
      "FR",
      "pt-BR",
      "IT",
      "LA", //not
      "CA",
      "RO",
      "NL",
    ],
    [
      "ar-EG",
      "FA",
      "HI",
      "UR",
      "BN",
      "TA",
      "zh-CN",
      "TH",
      "JA",
      "KO",
    ],
    [
      "RU",
      "PL",
      "HU",
      "CS",
      "SR",
      "SK",
      "UK",
      "TR",
      "KU",
      "HR",

    ],
    [
      "DA",
      "SV",
      "NO",
      "ET",
      "FI",
      "ID",
      "CY",
      "SQ",
      "EL",
      "SW",
    ],
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).canvasColor,
      body: Stack(
        children: <Widget>[
          Positioned(
            top: 0,
            left: 0,
            child: Image.asset("Assets/Images/upper.png"),
          ),
          ReturnArrow(),
          Positioned(
            bottom: 0,
            right: 0,
            child: Image.asset("Assets/Images/bottom.png"),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.2,
            child: Container(
              width: MediaQuery.of(context).size.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "Select Target Language",
                    style: TextStyle(fontSize: 30, color: Color(0xff385170)),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.width * 0.48,
            child: Container(
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          CustomButton(languagesList[i][0], "small",
                              languagesIsoList[i][0]),
                          CustomButton(languagesList[i][2], "small",
                              languagesIsoList[i][2]),
                          CustomButton(languagesList[i][4], "small",
                              languagesIsoList[i][4]),
                          CustomButton(languagesList[i][6], "small",
                              languagesIsoList[i][6]),
                          CustomButton(languagesList[i][8], "small",
                              languagesIsoList[i][8]),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          CustomButton(languagesList[i][1], "small",
                              languagesIsoList[i][1]),
                          CustomButton(languagesList[i][3], "small",
                              languagesIsoList[i][3]),
                          CustomButton(languagesList[i][5], "small",
                              languagesIsoList[i][5]),
                          CustomButton(languagesList[i][7], "small",
                              languagesIsoList[i][7]),
                          CustomButton(languagesList[i][9], "small",
                              languagesIsoList[i][9]),
                        ],
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      GestureDetector(
                        onTap: () {
                          if (i > 0) {
                            setState(() {
                              i--;
                            });
                          } else {
                            setState(() {
                              i = 3;
                            });
                          }
                        },
                        onTapDown: (x) {
                          setState(() {
                            hasBeenPressed1 = true;
                          });
                        },
                        onTapUp: (x) {
                          Future.delayed(const Duration(milliseconds: 200), () {
                            setState(() {
                              hasBeenPressed1 = false;
                            });
                          });
                        },
                        onTapCancel: () {
                          Future.delayed(const Duration(milliseconds: 200), () {
                            setState(() {
                              hasBeenPressed1 = false;
                            });
                          });
                        },
                        child: Container(
                          child:
                              MoreLanguages(Icons.arrow_back, hasBeenPressed1),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          if (i < 3) {
                            setState(() {
                              i++;
                            });
                          } else {
                            setState(() {
                              i = 0;
                            });
                          }
                        },
                        onTapDown: (x) {
                          setState(() {
                            hasBeenPressed2 = true;
                          });
                        },
                        onTapUp: (x) {
                          Future.delayed(const Duration(milliseconds: 200), () {
                            setState(() {
                              hasBeenPressed2 = false;
                            });
                          });
                        },
                        onTapCancel: () {
                          Future.delayed(const Duration(milliseconds: 200), () {
                            setState(() {
                              hasBeenPressed2 = false;
                            });
                          });
                        },
                        child:
                            MoreLanguages(Icons.arrow_forward, hasBeenPressed2),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class MoreLanguages extends StatefulWidget {
  IconData iconDirection;
  bool hasBeenPressed;

  MoreLanguages(this.iconDirection, this.hasBeenPressed);

  @override
  _MoreLanguagesState createState() => _MoreLanguagesState();
}

class _MoreLanguagesState extends State<MoreLanguages> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(5),
      height: 57,
      width: 100,
      child: Stack(children: <Widget>[
        AnimatedPositioned(
          duration: Duration(milliseconds: 50),
          top: widget.hasBeenPressed ? 7 : 0,
          child: AnimatedContainer(
            duration: Duration(milliseconds: 50),
            width: 100,
            height: 50,
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(
                  color: Theme.of(context).primaryColorDark,
                  offset: Offset(0, widget.hasBeenPressed ? 0 : 7),
                ),
              ],
            ),
            child: Center(
              child: Icon(
                widget.iconDirection,
                color: Color(0xffF9F8EB),
                size: 50,
              ),
            ),
          ),
        ),
      ]),
    );
  }
}
