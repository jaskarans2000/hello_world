import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:helloworldofficial/pages/projects_page.dart';
import 'package:helloworldofficial/pages/contests_page.dart';
import 'package:helloworldofficial/pages/team_project.dart';
import 'package:helloworldofficial/pages/trivia/trivia_intro.dart';
import 'package:helloworldofficial/pages/user_projects.dart';
import 'package:url_launcher/url_launcher.dart';
import '../main.dart';

class Home extends StatefulWidget {
  static String id = 'home_page';
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Future _launchURL() async {
    const url = 'https://flutter.dev';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  Future _launchURL1() async {
    const url = 'https://flutter.dev';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  Future _launchURL2() async {
    const url = 'https://flutter.dev';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
  @override
  void initState() {
    super.initState();
    user?.reload();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: backPressed,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text(
            'helloWorld',
            style: TextStyle(
              fontSize: 40.0,
              fontFamily: 'ButterflyKids',
            ),
          ),
          actions: <Widget>[
           user!=null? MaterialButton(
                child: Text("Logout",style: TextStyle(color: Colors.white),),
                onPressed: (){
                  signout();
                }):Container(height: 0.0,width: 0.0,)
          ],
        ),
        body: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
            image: AssetImage('images/Background.jpg'),
            fit: BoxFit.cover,
          )),
          child: ListView(
            children: <Widget>[
              SizedBox(
                height: 20.0,
              ),
              Card(
                elevation: 10.0,
                child: ListTile(
                  title: Text(
                    'Projects',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  trailing: Icon(
                    Icons.arrow_right,
                    color: Colors.black,
                  ),
                  onTap: (){
                    if(user==null){
                      Navigator.pushNamed(context, Projects.id);
                    }
                   else if(user.email=="helloworldteam.official@gmail.com"){
                      Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context){
                        return TeamProjects();
                      }));
                    }
                   else{
                     Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext c){
                       return UserProjects();
                     }));
                    }
                    },
                ),
              ),
              Card(
                elevation: 10.0,
                child: ListTile(
                  title: Text(
                    'Contests',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  trailing: Icon(
                    Icons.arrow_right,
                    color: Colors.black,
                  ),
                  onTap: (){
                    if(user==null)
                    Navigator.pushNamed(context, Contests.id);
                    else
                      Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext con){
                        return Trivia();
                      }));
                  }
                   ),
              ),
              new SizedBox(
                height: 30.0,
              ),
              new Container(
                margin: EdgeInsets.all(10.0),
                height: 350.0,
                width: MediaQuery.of(context).size.width,
                child: new Column(
                  children: <Widget>[
                    new Container(
                      height: 50.0,
                      padding: EdgeInsets.all(7.0),
                      decoration: new BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          color: Colors.black),
                      child: new Text("Our Team",
                          style: TextStyle(fontSize: 18.0, color: Colors.white)),
                    ),
                    new SizedBox(
                      height: 10.0,
                    ),
                    new Container(
                      margin: EdgeInsets.all(10.0),
                      height: 250.0,
                      width: 1250.0,
                      child: new ListView(
                        scrollDirection: Axis.horizontal,
                        children: <Widget>[
                          new Container(
                            height: 250.0,
                            width: 250.0,
                            color: Colors.black,
                            child: new Column(
                              children: <Widget>[
                                new Container(
                                  height: 150.0,
                                  width: 150.0,
                                  margin: EdgeInsets.all(10.0),
                                  decoration: new BoxDecoration(
                                    borderRadius: BorderRadius.circular(15.0),
                                    image: new DecorationImage(
                                        image: AssetImage('images/hirdan.jpg'),
                                        fit: BoxFit.cover),
                                  ),
                                ),
                                new SizedBox(
                                  height: 6.0,
                                ),
                                new Container(
                                  margin: EdgeInsets.all(4.0),
                                  child: new Text(
                                    "Hirdan Aggarwal",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 20.0),
                                  ),
                                ),
                                new SizedBox(
                                  height: 6.0,
                                ),
                                new Container(
                                  margin: EdgeInsets.all(4.0),
                                  child: new Text(
                                    "Flutter Developer",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 20.0),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          new SizedBox(
                            width: 10.0,
                          ),
                          new Container(
                            height: 250.0,
                            width: 250.0,
                            color: Colors.black,
                            child: new Column(
                              children: <Widget>[
                                new Container(
                                  height: 150.0,
                                  width: 150.0,
                                  margin: EdgeInsets.all(10.0),
                                  decoration: new BoxDecoration(
                                    borderRadius: BorderRadius.circular(15.0),
                                    image: new DecorationImage(
                                        image: AssetImage('images/hirdan.jpg'),
                                        fit: BoxFit.cover),
                                  ),
                                ),
                                new SizedBox(
                                  height: 6.0,
                                ),
                                new Container(
                                  margin: EdgeInsets.all(4.0),
                                  child: new Text(
                                    "Hirdan Aggarwal",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 20.0),
                                  ),
                                ),
                                new SizedBox(
                                  height: 6.0,
                                ),
                                new Container(
                                  margin: EdgeInsets.all(4.0),
                                  child: new Text(
                                    "Flutter Developer",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 20.0),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          new SizedBox(
                            width: 10.0,
                          ),
                          new Container(
                            height: 250.0,
                            width: 250.0,
                            color: Colors.black,
                            child: new Column(
                              children: <Widget>[
                                new Container(
                                  height: 150.0,
                                  width: 150.0,
                                  margin: EdgeInsets.all(10.0),
                                  decoration: new BoxDecoration(
                                    borderRadius: BorderRadius.circular(15.0),
                                    image: new DecorationImage(
                                        image: AssetImage('images/hirdan.jpg'),
                                        fit: BoxFit.cover),
                                  ),
                                ),
                                new SizedBox(
                                  height: 6.0,
                                ),
                                new Container(
                                  margin: EdgeInsets.all(4.0),
                                  child: new Text(
                                    "Hirdan Aggarwal",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 20.0),
                                  ),
                                ),
                                new SizedBox(
                                  height: 6.0,
                                ),
                                new Container(
                                  margin: EdgeInsets.all(4.0),
                                  child: new Text(
                                    "Flutter Developer",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 20.0),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          new SizedBox(
                            width: 10.0,
                          ),
                          new Container(
                            height: 250.0,
                            width: 250.0,
                            color: Colors.black,
                            child: new Column(
                              children: <Widget>[
                                new Container(
                                  height: 150.0,
                                  width: 150.0,
                                  margin: EdgeInsets.all(10.0),
                                  decoration: new BoxDecoration(
                                    borderRadius: BorderRadius.circular(15.0),
                                    image: new DecorationImage(
                                        image: AssetImage('images/hirdan.jpg'),
                                        fit: BoxFit.cover),
                                  ),
                                ),
                                new SizedBox(
                                  height: 6.0,
                                ),
                                new Container(
                                  margin: EdgeInsets.all(4.0),
                                  child: new Text(
                                    "Hirdan Aggarwal",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 20.0),
                                  ),
                                ),
                                new SizedBox(
                                  height: 6.0,
                                ),
                                new Container(
                                  margin: EdgeInsets.all(4.0),
                                  child: new Text(
                                    "Flutter Developer",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 20.0),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          new SizedBox(
                            width: 10.0,
                          ),
                          new Container(
                            height: 250.0,
                            width: 250.0,
                            color: Colors.black,
                            child: new Column(
                              children: <Widget>[
                                new Container(
                                  height: 150.0,
                                  width: 150.0,
                                  margin: EdgeInsets.all(10.0),
                                  decoration: new BoxDecoration(
                                    borderRadius: BorderRadius.circular(15.0),
                                    image: new DecorationImage(
                                        image: AssetImage('images/hirdan.jpg'),
                                        fit: BoxFit.cover),
                                  ),
                                ),
                                new SizedBox(
                                  height: 6.0,
                                ),
                                new Container(
                                  margin: EdgeInsets.all(4.0),
                                  child: new Text(
                                    "Hirdan Aggarwal",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 20.0),
                                  ),
                                ),
                                new SizedBox(
                                  height: 6.0,
                                ),
                                new Container(
                                  margin: EdgeInsets.all(4.0),
                                  child: new Text(
                                    "Flutter Developer",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 20.0),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          new SizedBox(
                            width: 10.0,
                          ),
                          new Container(
                            height: 250.0,
                            width: 250.0,
                            color: Colors.black,
                            child: new Column(
                              children: <Widget>[
                                new Container(
                                  height: 150.0,
                                  width: 150.0,
                                  margin: EdgeInsets.all(10.0),
                                  decoration: new BoxDecoration(
                                    borderRadius: BorderRadius.circular(15.0),
                                    image: new DecorationImage(
                                        image: AssetImage('images/hirdan.jpg'),
                                        fit: BoxFit.cover),
                                  ),
                                ),
                                new SizedBox(
                                  height: 6.0,
                                ),
                                new Container(
                                  margin: EdgeInsets.all(4.0),
                                  child: new Text(
                                    "Hirdan Aggarwal",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 20.0),
                                  ),
                                ),
                                new SizedBox(
                                  height: 6.0,
                                ),
                                new Container(
                                  margin: EdgeInsets.all(4.0),
                                  child: new Text(
                                    "Flutter Developer",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 20.0),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          new SizedBox(
                            width: 10.0,
                          ),
                          new Container(
                            height: 250.0,
                            width: 250.0,
                            color: Colors.black,
                            child: new Column(
                              children: <Widget>[
                                new Container(
                                  height: 150.0,
                                  width: 150.0,
                                  margin: EdgeInsets.all(10.0),
                                  decoration: new BoxDecoration(
                                    borderRadius: BorderRadius.circular(15.0),
                                    image: new DecorationImage(
                                        image: AssetImage('images/hirdan.jpg'),
                                        fit: BoxFit.cover),
                                  ),
                                ),
                                new SizedBox(
                                  height: 6.0,
                                ),
                                new Container(
                                  margin: EdgeInsets.all(4.0),
                                  child: new Text(
                                    "Hirdan Aggarwal",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 20.0),
                                  ),
                                ),
                                new SizedBox(
                                  height: 6.0,
                                ),
                                new Container(
                                  margin: EdgeInsets.all(4.0),
                                  child: new Text(
                                    "Flutter Developer",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 20.0),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          new SizedBox(
                            width: 10.0,
                          ),
                          new Container(
                            height: 250.0,
                            width: 250.0,
                            color: Colors.black,
                            child: new Column(
                              children: <Widget>[
                                new Container(
                                  height: 150.0,
                                  width: 150.0,
                                  margin: EdgeInsets.all(10.0),
                                  decoration: new BoxDecoration(
                                    borderRadius: BorderRadius.circular(15.0),
                                    image: new DecorationImage(
                                        image: AssetImage('images/hirdan.jpg'),
                                        fit: BoxFit.cover),
                                  ),
                                ),
                                new SizedBox(
                                  height: 6.0,
                                ),
                                new Container(
                                  margin: EdgeInsets.all(4.0),
                                  child: new Text(
                                    "Hirdan Aggarwal",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 20.0),
                                  ),
                                ),
                                new SizedBox(
                                  height: 6.0,
                                ),
                                new Container(
                                  margin: EdgeInsets.all(4.0),
                                  child: new Text(
                                    "Flutter Developer",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 20.0),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          new SizedBox(
                            width: 10.0,
                          ),
                          new Container(
                            height: 250.0,
                            width: 250.0,
                            color: Colors.black,
                            child: new Column(
                              children: <Widget>[
                                new Container(
                                  height: 150.0,
                                  width: 150.0,
                                  margin: EdgeInsets.all(10.0),
                                  decoration: new BoxDecoration(
                                    borderRadius: BorderRadius.circular(15.0),
                                    image: new DecorationImage(
                                        image: AssetImage('images/hirdan.jpg'),
                                        fit: BoxFit.cover),
                                  ),
                                ),
                                new SizedBox(
                                  height: 6.0,
                                ),
                                new Container(
                                  margin: EdgeInsets.all(4.0),
                                  child: new Text(
                                    "Hirdan Aggarwal",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 20.0),
                                  ),
                                ),
                                new SizedBox(
                                  height: 6.0,
                                ),
                                new Container(
                                  margin: EdgeInsets.all(4.0),
                                  child: new Text(
                                    "Flutter Developer",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 20.0),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          new SizedBox(
                            width: 10.0,
                          ),
                          new Container(
                            height: 250.0,
                            width: 250.0,
                            color: Colors.black,
                            child: new Column(
                              children: <Widget>[
                                new Container(
                                  height: 150.0,
                                  width: 150.0,
                                  margin: EdgeInsets.all(10.0),
                                  decoration: new BoxDecoration(
                                    borderRadius: BorderRadius.circular(15.0),
                                    image: new DecorationImage(
                                        image: AssetImage('images/hirdan.jpg'),
                                        fit: BoxFit.cover),
                                  ),
                                ),
                                new SizedBox(
                                  height: 6.0,
                                ),
                                new Container(
                                  margin: EdgeInsets.all(4.0),
                                  child: new Text(
                                    "Hirdan Aggarwal",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 20.0),
                                  ),
                                ),
                                new SizedBox(
                                  height: 6.0,
                                ),
                                new Container(
                                  margin: EdgeInsets.all(4.0),
                                  child: new Text(
                                    "Flutter Developer",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 20.0),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          new SizedBox(
                            width: 10.0,
                          ),
                          new Container(
                            height: 250.0,
                            width: 250.0,
                            color: Colors.black,
                            child: new Column(
                              children: <Widget>[
                                new Container(
                                  height: 150.0,
                                  width: 150.0,
                                  margin: EdgeInsets.all(10.0),
                                  decoration: new BoxDecoration(
                                    borderRadius: BorderRadius.circular(15.0),
                                    image: new DecorationImage(
                                        image: AssetImage('images/hirdan.jpg'),
                                        fit: BoxFit.cover),
                                  ),
                                ),
                                new SizedBox(
                                  height: 6.0,
                                ),
                                new Container(
                                  margin: EdgeInsets.all(4.0),
                                  child: new Text(
                                    "Hirdan Aggarwal",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 20.0),
                                  ),
                                ),
                                new SizedBox(
                                  height: 6.0,
                                ),
                                new Container(
                                  margin: EdgeInsets.all(4.0),
                                  child: new Text(
                                    "Flutter Developer",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 20.0),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          new SizedBox(
                            width: 10.0,
                          ),
                          new Container(
                            height: 250.0,
                            width: 250.0,
                            color: Colors.black,
                            child: new Column(
                              children: <Widget>[
                                new Container(
                                  height: 150.0,
                                  width: 150.0,
                                  margin: EdgeInsets.all(10.0),
                                  decoration: new BoxDecoration(
                                    borderRadius: BorderRadius.circular(15.0),
                                    image: new DecorationImage(
                                        image: AssetImage('images/hirdan.jpg'),
                                        fit: BoxFit.cover),
                                  ),
                                ),
                                new SizedBox(
                                  height: 6.0,
                                ),
                                new Container(
                                  margin: EdgeInsets.all(4.0),
                                  child: new Text(
                                    "Hirdan Aggarwal",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 20.0),
                                  ),
                                ),
                                new SizedBox(
                                  height: 6.0,
                                ),
                                new Container(
                                  margin: EdgeInsets.all(4.0),
                                  child: new Text(
                                    "Flutter Developer",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 20.0),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          new SizedBox(
                            width: 10.0,
                          ),
                          new Container(
                            height: 250.0,
                            width: 250.0,
                            color: Colors.black,
                            child: new Column(
                              children: <Widget>[
                                new Container(
                                  height: 150.0,
                                  width: 150.0,
                                  margin: EdgeInsets.all(10.0),
                                  decoration: new BoxDecoration(
                                    borderRadius: BorderRadius.circular(15.0),
                                    image: new DecorationImage(
                                        image: AssetImage('images/hirdan.jpg'),
                                        fit: BoxFit.cover),
                                  ),
                                ),
                                new SizedBox(
                                  height: 6.0,
                                ),
                                new Container(
                                  margin: EdgeInsets.all(4.0),
                                  child: new Text(
                                    "Hirdan Aggarwal",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 20.0),
                                  ),
                                ),
                                new SizedBox(
                                  height: 6.0,
                                ),
                                new Container(
                                  margin: EdgeInsets.all(4.0),
                                  child: new Text(
                                    "Flutter Developer",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 20.0),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          new SizedBox(
                            width: 10.0,
                          ),
                          new Container(
                            height: 250.0,
                            width: 250.0,
                            color: Colors.black,
                            child: new Column(
                              children: <Widget>[
                                new Container(
                                  height: 150.0,
                                  width: 150.0,
                                  margin: EdgeInsets.all(10.0),
                                  decoration: new BoxDecoration(
                                    borderRadius: BorderRadius.circular(15.0),
                                    image: new DecorationImage(
                                        image: AssetImage('images/hirdan.jpg'),
                                        fit: BoxFit.cover),
                                  ),
                                ),
                                new SizedBox(
                                  height: 6.0,
                                ),
                                new Container(
                                  margin: EdgeInsets.all(4.0),
                                  child: new Text(
                                    "Hirdan Aggarwal",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 20.0),
                                  ),
                                ),
                                new SizedBox(
                                  height: 6.0,
                                ),
                                new Container(
                                  margin: EdgeInsets.all(4.0),
                                  child: new Text(
                                    "Flutter Developer",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 20.0),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              RaisedButton(
                onPressed: _launchURL,
                child: Text(
                  'Hello World official Website',
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
              ),
              RaisedButton(
                onPressed: _launchURL1,
                child: Text(
                  'Hello World Instagram Handle',
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
              ),
              RaisedButton(
                onPressed: _launchURL2,
                child: Text(
                  'Hello World Facebook Handle',
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<bool> backPressed() {
   return showDialog(
        context: context,
        builder: (context)=>AlertDialog(
          title: Text("Alert!",style: TextStyle(color: Colors.red),),
          content: Text("Are you sure you want to exit the app?",style: TextStyle(color: Colors.blue),),
          actions: <Widget>[
            FlatButton(onPressed:()=> Navigator.pop(context,false), child: Text("No")),
            FlatButton(onPressed: (){
              Navigator.pop(context,true);
            }, child: Text("Yes"))
          ],
        ));
  }

   signout() async{
     setState(() {
       auth.signOut();
     });
     FirebaseUser u=await auth.currentUser();
     setState(() {
       user=u;
     });
   }
}
