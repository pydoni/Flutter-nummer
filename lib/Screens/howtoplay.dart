import 'package:flutter/material.dart';
import 'package:nummer/components/SimpleComponents.dart';


class HowToPlay extends StatelessWidget {
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
          ReturnArrow(),
          Positioned(
            top: MediaQuery.of(context).size.height*0.2,
            child: Container(
              width: MediaQuery.of(context).size.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "How to play",
                    style: Theme.of(context).textTheme.body1,
                  ),
                  Container(
                    margin: EdgeInsets.all(16),
                    child: Column(
                      children: <Widget>[
                        Text(
                          "Press start and listen to the number, type the number"
                          " and verify if you got it right, if you didn't, press "
                          "the speaker icon to hear it again.\n",
                          style: Theme.of(context).textTheme.body2,
                          textAlign: TextAlign.center,
                        ),
                        Text("Each difficulty has a different number size, with easy"
                              " going up to 2 digits and extreme going up to 6 digits",
                          style: Theme.of(context).textTheme.body2,
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
