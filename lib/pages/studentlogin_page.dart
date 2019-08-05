import 'package:flutter/material.dart';
import 'package:helloworldofficial/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:helloworldofficial/pages/trivia/trivia_intro.dart';

import 'home_page.dart';

class StudentLogin extends StatefulWidget {
  static String id = 'studentlogin_page';
  @override
  _StudentLoginState createState() => _StudentLoginState();
}

class _StudentLoginState extends State<StudentLogin> {
  FirebaseAuth auth=FirebaseAuth.instance;
  final GlobalKey<FormState> Formkey=GlobalKey<FormState>();
  String email;
  String password;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          'Student Login',
          style: TextStyle(
            fontSize: 30.0,
            fontFamily: 'ButterflyKids',
          ),
        ),
      ),
      body:Center(
        child: Form(
          key: Formkey,
          child:SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                        labelText: "Enter Your email id",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(29),
                            gapPadding: 3.3
                        )
                    ),
                    validator: (value){
                      if(value.isEmpty ){
                        return "Please enter valid email";}
                      else{
                        email=value;}
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                        labelText: "Enter Password",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(29),
                            gapPadding: 3.3
                        )
                    ),
                    validator: (value){
                      if(value.isEmpty ){
                        return "Please enter valid password";}
                      else{
                        password=value;}
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 16.0),
                  child: Material(
                    elevation: 5.0,
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(30.0),
                    child: MaterialButton(
                      onPressed: () {
                        if(Formkey.currentState.validate()){
                          if(this.mounted)setState(() {
                            auth.signInWithEmailAndPassword(email: email, password: password);
                          });
                          }
                        Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext c){
                          return Home();
                        }));
                      },
                      minWidth: 200.0,
                      height: 42.0,
                      child: Text(
                        'Login',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),),
      ),
    );
  }
}
