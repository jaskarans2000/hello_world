import 'package:flutter/material.dart';
import 'package:helloworldofficial/pages/registration_page.dart';
import 'package:helloworldofficial/pages/studentlogin_page.dart';
import 'teamlogin_page.dart';

class Projects extends StatefulWidget {
  static String id = 'projects_page';
  @override
  _ProjectsState createState() => _ProjectsState();
}

class _ProjectsState extends State<Projects> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(10.0),
              child: Text(
                'Projects',
                style: TextStyle(
                  fontSize: 30.0,
                  fontFamily: 'ButterflyKids',
                ),
              ),
            )
          ],
        ),
      ),
      body:  Container(
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
                      'Log In',
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
                      'Registeration',
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
