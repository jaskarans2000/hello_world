import 'package:flutter/material.dart';
import 'package:helloworldofficial/pages/trivia/trivia_intro.dart';

import '../home_page.dart';
class ScoreScreen extends StatefulWidget {
  int score;

  ScoreScreen(this.score);

  @override
  _ScoreScreenState createState() => _ScoreScreenState();
}

class _ScoreScreenState extends State<ScoreScreen> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: backPressed,
      child: Scaffold(
        appBar: AppBar(
          title: Text("ScoreCard",style: TextStyle(
              fontSize: 30.0,
              fontFamily: 'ButterflyKids',
              color: Colors.white
          ),),backgroundColor: Colors.black,
        ),
        backgroundColor: Colors.blueGrey,
        body: Stack(
          children: <Widget>[
            Align(
              alignment: Alignment.center,
              child: Text("Your Score is: ${widget.score}",style: TextStyle(color: Colors.red,fontSize: 25.0,fontWeight: FontWeight.bold,fontStyle: FontStyle.italic),),
            )
          ],
        ),
      ),
    );
  }

Future<bool>  backPressed() {
    return Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(
        builder: (context)=>Trivia()
        ,settings: RouteSettings(name: "/main"))
        , (Route<dynamic> route) => false);
  }
}
