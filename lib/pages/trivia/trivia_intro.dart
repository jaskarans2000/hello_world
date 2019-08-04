import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:helloworldofficial/pages/trivia/questions.dart';

import '../home_page.dart';
import 'leaderboard.dart';

class Trivia extends StatefulWidget {
  @override
  _TriviaState createState() => _TriviaState();
}

class _TriviaState extends State<Trivia> {
  FirebaseAuth auth=FirebaseAuth.instance;
  final startTime = DateTime(2019, 8, 14, 21, 00);
  final endTime = DateTime(2019, 8, 14, 22, 30);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Contests',
          style: TextStyle(
            fontSize: 30.0,
            fontFamily: 'ButterflyKids',
          ),
        ),
        backgroundColor: Colors.black,
        actions: <Widget>[
         MaterialButton(
             child: Text("LogOut!",style: TextStyle(
               fontSize: 30.0,
               color: Colors.white,
               fontFamily: 'ButterflyKids',
             ),),
             onPressed: (){
               auth.signOut();
               Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(
                   builder: (context)=>Home()
                   ,settings: RouteSettings(name: "/main"))
                   , (Route<dynamic> route) => false);
             })
        ],
      ),
      body: Stack(
        children: <Widget>[
          Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Image.asset('images/Background.jpg',fit: BoxFit.fill,)),
          GestureDetector(
            onTap: (){
              final currentTime = DateTime.now();
              if(currentTime.isBefore(startTime)){
                showDialog(
                    context: context,
                    builder: (context)=>AlertDialog(
                      title: Text("Be Patient!",style: TextStyle(color: Colors.red),),
                      content: Text("The contest will start on 9:00 PM",style: TextStyle(color: Colors.blue),),
                      actions: <Widget>[
                        FlatButton(onPressed:()=> Navigator.pop(context,false), child: Text("Okay")),
                      ],
                    ));
              }
              if(currentTime.isAfter(startTime) && currentTime.isBefore(endTime)){
                Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext con){
                return Questions();
              }));}
              if(currentTime.isAfter(endTime)){
                Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext con){
                  return LeaderBoard();
                }));
              }
            },
            child: Container(
              height: 250.0,
              width: 250.0,
              child: Material(
                elevation: 4.5,
                color: Colors.white,
                borderRadius: BorderRadius.circular(25.0),
                child: Center(child: Stack(
                  children: <Widget>[
                    Text("Trivia",style: TextStyle(fontSize: 25.0,fontWeight: FontWeight.bold),),
                    Padding(
                      padding: const EdgeInsets.only(top:40.0),
                      child: Text("Date: 14 August 2019",style: TextStyle(fontWeight: FontWeight.bold)),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top:60.0),
                      child: Text("Timing: 9:00-10:30 PM",style: TextStyle(fontWeight: FontWeight.bold)),
                    ),
                  ],
                ),),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
