import 'package:flutter/material.dart';
import 'package:nummer/components/SimpleComponents.dart';
import 'package:nummer/components/CustomButton.dart';


class SelectDifficulty extends StatelessWidget {
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
          HowToPlaySmall(),
          Positioned(
            bottom: 0,
            right: 0,
            child: Image.asset("Assets/Images/bottom.png"),
          ),


          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                CustomButton("Easy","medium","/game"),
                CustomButton("Normal","medium","/game"),
                CustomButton("Hard","medium","/game"),
                CustomButton("Extreme","medium","/game"),
              ],
            ),
          )


        ],
      ),
    );
  }
}
