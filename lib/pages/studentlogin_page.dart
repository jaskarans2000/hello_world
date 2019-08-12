import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../main.dart';
import 'home_page.dart';

class StudentLogin extends StatefulWidget {
  static String id = 'studentlogin_page';
  @override
  _StudentLoginState createState() => _StudentLoginState();
}

class _StudentLoginState extends State<StudentLogin> {

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
                    validator: (val){
                      Pattern pattern =
                          r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                      RegExp regex = new RegExp(pattern);
                      if (val.isEmpty ||
                          val == " " ||
                          val.length < 5 ||
                          !regex.hasMatch(val)) {
                        return "Enter Valid Email Address";
                      }
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
                    obscureText: true,
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
                          if(Firestore.instance.collection("Users").document(email)!=null)
                          if(this.mounted)setState(() {
                            auth.signInWithEmailAndPassword(email: email, password: password);
                          });
                          }
                        getUSer();
                        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (BuildContext c){
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

   getUSer() async{
    FirebaseUser u=await auth.currentUser();
    setState(() {
      user=u;
    });
   }
}
