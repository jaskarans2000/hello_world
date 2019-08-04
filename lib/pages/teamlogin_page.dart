import 'package:flutter/material.dart';
import 'package:helloworldofficial/constants.dart';

class TeamLogin extends StatefulWidget {
  static String id = 'teamlogin_page';
  @override
  _TeamLoginState createState() => _TeamLoginState();
}

class _TeamLoginState extends State<TeamLogin> {
  String username;
  String password;
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
                'Team Login',
                style: TextStyle(
                  fontSize: 30.0,
                  fontFamily: 'ButterflyKids',
                ),
              ),
            )
          ],
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            TextField(
              textAlign: TextAlign.center,
              onChanged: (value) {
                username = value;
              },
              decoration:
                  kTextFieldDecoration.copyWith(hintText: 'Enter username'),
            ),
            SizedBox(
              height: 8.0,
            ),
            TextField(
              obscureText: true,
              textAlign: TextAlign.center,
              onChanged: (value) {
                password = value;
              },
              decoration:
                  kTextFieldDecoration.copyWith(hintText: 'Enter password'),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 16.0),
              child: Material(
                elevation: 5.0,
                color: Colors.black,
                borderRadius: BorderRadius.circular(30.0),
                child: MaterialButton(
                  onPressed: () {}, //TODO
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
          ],
        ),
      ),
    );
  }
}
