import 'dart:math';
import 'package:flutter_tts/flutter_tts.dart';


class GameLogic{





  String LanguageSelected;
  int Difficulty;

  GameLogic(this.LanguageSelected,this.Difficulty);

  String ttsnumber = "";
  String Checker = "";
  String ButtonState = "Start";
  int RandomNumber;
  int Score = 0;
  int tries = 0;
  String lifes ="-    -    -";
  String theNumberIs = "";


  final FlutterTts flutterTts = FlutterTts();

  Random random = new Random();


  Future setDefault() async{
    await flutterTts.setLanguage(LanguageSelected);
    await flutterTts.setPitch(0.8);
    await flutterTts.setSpeechRate(0.7);
  }

  Future speak() async {
    await flutterTts.speak(ttsnumber);
  }


  void startgame(Random random, Future speak(),String txtcontent) {

    if(ButtonState == "Start"){
       ButtonState = "Verify";
       lifes ="-    -    -";
       theNumberIs = "";
       Checker = "";
       tries = 0;
       setDefault();
       randomizer(random, speak);
    }else{
      verifier(random, speak, txtcontent);
    }
  }


  void randomizer(Random random, Future speak()){
    RandomNumber = random.nextInt(Difficulty);
    ttsnumber = RandomNumber.toString();
    speak();
  }

  void verifier(Random random, Future speak(),String txtcontent) {
    if (txtcontent == ttsnumber) {

        Score++;
        Checker = "  You got it right!";
        tries = 0;



        randomizer(random, speak);

    }else if(tries == 2) {
        tries++;
        Checker = "Game over!";

        Score = 0;
        ButtonState = "Start";
    }else{
      Checker = "You got it wrong!";
      tries++;
      speak();

    }


    switch(tries){
      case 1:
        lifes ="X    -    -";
        break;
      case 2:
        lifes ="X    X    -";
        break;
      case 3:
        lifes ="X    X    X";
        theNumberIs ="the number \nwas $ttsnumber";
        break;

    }

  }
}