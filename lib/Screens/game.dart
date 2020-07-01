import 'package:flutter/cupertino.dart';
import 'package:sailor/sailor.dart';
import 'package:flutter/material.dart';
import 'package:nummer/components/SimpleComponents.dart';
import 'package:nummer/GameLogic/GameLogic.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Game extends StatefulWidget {
  @override
  _GameState createState() => _GameState();
}

class _GameState extends State<Game> {
  String hintChecker = "";

  GameLogic logic = GameLogic("en-US", 100);

  Future<void> getLanguageFromSharedPref(GameLogic logic) async {
    final prefs = await SharedPreferences.getInstance();
    logic.LanguageSelected = prefs.getString('language');
  }

  bool hasBeenPressed = false;
  TextEditingController numberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final difficulty = Sailor.param<int>(context, 'difficulty');
    logic.Difficulty = difficulty;
    getLanguageFromSharedPref(logic);

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
          HowToPlaySmall(),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.15,
            child: Container(
              width: MediaQuery.of(context).size.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  GestureDetector(
                    onTap: () {
                      if (logic.ButtonState == "Verify") {
                        logic.speak();
                      }
                    },
                    child: Icon(
                      Icons.volume_up,
                      size: 150,
                      color: Theme.of(context).primaryColorDark,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.46,
            child: Container(
              width: MediaQuery.of(context).size.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    height: 60,
                    width: 170,
                    child: TextField(
                      controller: numberController,
                      style: TextStyle(
                        color: Theme.of(context).primaryColorDark,
                        fontFamily: 'balsamiq',
                        fontSize: 15,
                      ),
                      decoration: InputDecoration(
                        hintText: hintChecker,
                        filled: true,
                        fillColor: Color(0xffF9F8EB),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            width: 3,
                            color: Theme.of(context).primaryColorDark,
                          ),
                          borderRadius: BorderRadius.all(
                            Radius.circular(15),
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            width: 3,
                            color: Theme.of(context).primaryColorDark,
                          ),
                          borderRadius: BorderRadius.all(
                            Radius.circular(15),
                          ),
                        ),
                      ),
                      keyboardType: TextInputType.numberWithOptions(),
                    ),
                  ),
                  GestureDetector(
                      onTapDown: (x) {
                        setState(() {
                          logic.startgame(
                              logic.random, logic.speak, numberController.text);
                        });

                        setState(() {
                          hasBeenPressed = true;

                          numberController.clear();
                          hintChecker = logic.Checker;
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
                      child: Container(
                        margin: EdgeInsets.all(5),
                        height: 51,
                        width: 80,
                        child: Stack(children: <Widget>[
                          AnimatedPositioned(
                            duration: Duration(milliseconds: 50),
                            top: hasBeenPressed ? 7 : 0,
                            child: AnimatedContainer(
                              duration: Duration(milliseconds: 50),
                              width: 80,
                              height: 44,
                              decoration: BoxDecoration(
                                color: Theme.of(context).primaryColor,
                                borderRadius: BorderRadius.circular(15),
                                boxShadow: [
                                  BoxShadow(
                                    color: Theme.of(context).primaryColorDark,
                                    offset: Offset(0, hasBeenPressed ? 0 : 7),
                                  ),
                                ],
                              ),
                              child: Center(
                                child: Text(
                                  logic.ButtonState,
                                  // ignore: deprecated_member_use
                                  style: TextStyle(
                                      color: Color(0xffF9F8EB), fontSize: 20),
                                ),
                              ),
                            ),
                          ),
                        ]),
                      )),
                ],
              ),
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.37,
            child: Container(
              width: MediaQuery.of(context).size.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "Streak : ${logic.Score}",
                    style: Theme.of(context).textTheme.body1,
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.55,
            child: Container(
              width: MediaQuery.of(context).size.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    logic.lifes,
                    style: TextStyle(
                        fontSize: 30,
                        color: Theme.of(context).primaryColorDark),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.135,
            right: MediaQuery.of(context).size.width * 0.03,
            child: Text(
              logic.theNumberIs,
              style: TextStyle(
                  fontSize: 20, color: Theme.of(context).primaryColorDark),
            ),
          ),
        ],
      ),
    );
  }
}
