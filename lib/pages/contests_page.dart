import 'package:flutter/material.dart';
import 'studentlogin_page.dart';
import 'registration_page.dart';

class Contests extends StatefulWidget {
  static String id = 'contests_page';
  @override
  _ContestsState createState() => _ContestsState();
}

class _ContestsState extends State<Contests> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          'Contests',
          style: TextStyle(
            fontSize: 30.0,
            fontFamily: 'ButterflyKids',
          ),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
          image: AssetImage('images/Background.jpg'),
          fit: BoxFit.fill,
        )),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.symmetric(vertical: 16.0),
                child: Material(
                  elevation: 5.0,
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(30.0),
                  child: MaterialButton(
                    onPressed: () {
                      Navigator.pushNamed(context, StudentLogin.id);
                    },
                    minWidth: 200.0,
                    height: 42.0,
                    child: Text(
                      'Student Log In',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 16.0),
                child: Material(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(30.0),
                  elevation: 5.0,
                  child: MaterialButton(
                    onPressed: () {
                      Navigator.pushNamed(context, Registration.id);
                    },
                    minWidth: 200.0,
                    height: 42.0,
                    child: Text(
                      'Student Registeration',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
