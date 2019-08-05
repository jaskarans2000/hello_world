import 'package:flutter/material.dart';
import 'package:helloworldofficial/Model/student.dart';
import 'package:helloworldofficial/constants.dart';
import 'package:helloworldofficial/pages/trivia/trivia_intro.dart';
import 'home_page.dart';
import 'studentlogin_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

class Registration extends StatefulWidget {
  static String id = 'registration_page';
  @override
  _RegistrationState createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {

  final GlobalKey<FormState> Formkey=GlobalKey<FormState>();
  List<String> year=["First","Second","Third","Fourth"];
  List<String> stream=["CSE","ECE","IT","Other"];
  FirebaseAuth auth=FirebaseAuth.instance;
  Student student=Student();
  String name;
  String username;
  String email;
  String phone;
  String passwd;
  String selectedstream="CSE";
  String selectedyear="First";
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
                'Student Registration',
                style: TextStyle(
                  fontSize: 30.0,
                  fontFamily: 'ButterflyKids',
                ),
              ),
            )
          ],
        ),
      ),
      body: Center(
        child: Form(
            key: Formkey,
            child:SingleChildScrollView(
              child: Column(
          children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: InputDecoration(
                      labelText: "Enter Your Name",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(29),
                          gapPadding: 3.3
                      )
                  ),
                  validator: (value){
                    if(value.isEmpty ){
                      return "Please enter valid name";}
                    else{
                      name=value;
                    }
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: InputDecoration(
                      labelText: "Enter Username",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(29),
                          gapPadding: 3.3
                      )
                  ),
                  validator: (value){
                    if(value.isEmpty ){
                      return "Please enter valid username";}
                    else{
                      username=value;}
                  },
                ),
              ),
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
                      labelText: "Enter Your Phone number",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(29),
                          gapPadding: 3.3
                      )
                  ),
                  keyboardType: TextInputType.phone,
                  maxLength: 10,
                  maxLengthEnforced: true,
                  validator: (value){
                    if(value.isEmpty ){
                      return "Please enter valid phone number";}
                    else{
                      phone=value;}
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: DropdownButton<String>(
                    value: selectedstream,
                  hint: Text("Stream"),
                    isExpanded: true,
                    items: stream.map((String item){
                      return  DropdownMenuItem<String>(
                          value: item,
                          child: Text(item));
                    }).toList(),
                    onChanged: (String selected){
                      setState(() {
                        selectedstream=selected;
                      });
                    }),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: DropdownButton<String>(
                    value: selectedyear,
                  hint: Text("Year"),
                    isExpanded: true,
                    items: year.map((String item){
                      return  DropdownMenuItem<String>(
                          value: item,
                          child: Text(item));
                    }).toList(),
                    onChanged: (String selected){
                      setState(() {
                        selectedyear=selected;
                      });
                    }),
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
                    else if(value.length<6){return "passwd must contain atleast 6 characters";}
                    else{
                      passwd=value;}
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
                          auth.createUserWithEmailAndPassword(email: email, password: passwd);
                          auth.signInWithEmailAndPassword(email: email, password: passwd);
                        });
                        if(auth.currentUser() != null)
                      {Firestore.instance
                          .collection('Users')
                          .document("${email}")
                          .setData( {"Name":name,
                                      "Username":username,
                                     "Email":email,
                                     "Phone":phone,
                                     "Stream":selectedstream,
                                     "Year":selectedyear,
                                     "Password":passwd}, merge: true);
                      }}
                      Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext c){
                        return Home();
                      }));
                    },
                    minWidth: 200.0,
                    height: 42.0,
                    child: Text(
                      'Register',
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
