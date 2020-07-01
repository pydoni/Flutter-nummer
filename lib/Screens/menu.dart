import 'package:flutter/material.dart';
import 'package:nummer/components/CustomButton.dart';

class Menu extends StatelessWidget {
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
                  Text("nummer", style: TextStyle(fontSize: 68,color: Color(0xff385170)),),
                ],
              ),
            ),
          ),

          Positioned(
            top: MediaQuery.of(context).size.height * 0.35,
            child: Container(
              width: MediaQuery.of(context).size.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[

                  CustomButton("Select Language","large","/selectLanguage"),
                  CustomButton("Play","large","/selectDifficulty"),
                  CustomButton("How to play","large","/howToPlay"),
                ],
              ),
            ),
          )


        ],
      ),
    );
  }
}
