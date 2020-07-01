import 'package:flutter/material.dart';

class ReturnArrow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: MediaQuery.of(context).size.height * 0.03,
      left: MediaQuery.of(context).size.width * 0.05,
      child: GestureDetector(
        onTap: (){
          Navigator.of(context).pop();
        },
        child: Icon(
          Icons.arrow_back,
          color: Color(0xffF9F8EB),
          size: 50,
        ),
      ),
    );
  }
}

class HowToPlaySmall extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: MediaQuery.of(context).size.height * 0.03,
      right: MediaQuery.of(context).size.height * 0.03,
      child: GestureDetector(
        onTap: (){

          Navigator.of(context).pushNamed("/howToPlay");

        },
        child: Text(
          "How to play",
          style: Theme.of(context).textTheme.body2,
        ),
      ),
    );
  }
}



