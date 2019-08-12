import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../main.dart';
import '../home_page.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
    super.initState();
    Timer(Duration(seconds: 2), loggedInUser);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: <Widget>[
            Image.asset("images/splash.jpg",
            ),
            Padding(
              padding: const EdgeInsets.only(top:60.0),
              child: Align(
                alignment: Alignment.topCenter,
                child: Text("Hello World",style: TextStyle(color: Colors.white,fontSize: 30.0),),
              ),
            )
          ],
        ),
      ),
    );
  }

  void loggedInUser() async{
    FirebaseUser u=await auth.currentUser();
    if(this.mounted)setState(() {
      user=u;
    });
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext c){
      return Home();
    }));
  }
}
