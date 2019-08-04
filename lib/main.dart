import 'package:flutter/material.dart';
import 'package:helloworldofficial/pages/home_page.dart';
import 'package:helloworldofficial/pages/projects_page.dart';
import 'package:helloworldofficial/pages/contests_page.dart';
import 'package:helloworldofficial/pages/registration_page.dart';
import 'package:helloworldofficial/pages/studentlogin_page.dart';
import 'package:helloworldofficial/pages/teamlogin_page.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: Home.id,
      routes: {
        Home.id: (context) => Home(),
        Projects.id: (context) => Projects(),
        Contests.id: (context) => Contests(),
        Registration.id: (context) => Registration(),
        StudentLogin.id: (context) => StudentLogin(),
        TeamLogin.id: (context) => TeamLogin(),
      },
    );
  }
}
