import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ProjectExplained extends StatefulWidget {
  String title;
  Map<String,dynamic> map;

  ProjectExplained(this.title,this.map);

  @override
  _ProjectExplainedState createState() => _ProjectExplainedState();
}

class _ProjectExplainedState extends State<ProjectExplained> {
  String mentor="";
  String description="";
  FirebaseUser user;
  FirebaseAuth auth=FirebaseAuth.instance;
  TextEditingController controller=TextEditingController();

  @override
  void initState() {
    super.initState();
    mentor=widget.map["mentor"];
    description=widget.map["description"];
    getUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${widget.title}", style: TextStyle(
          fontSize: 30.0,
          fontFamily: 'ButterflyKids',
        ),),backgroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("Mentor: $mentor\n\nDescription: $description",style: TextStyle(fontSize: 20.0),),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: controller,
                decoration: InputDecoration(
                  labelText: "add link to github for submission"
                ),
                validator: (value){
                  if(value.isEmpty)
                    return "give valid link";
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: MaterialButton(
                  child: Text("Submit",style: TextStyle(color: Colors.white),),
                  color: Colors.black,
                  onPressed: (){
                    if(controller.text.isNotEmpty&&controller.text!=null){
                      Firestore.instance.collection("Projects").document("${widget.title}").collection("Submissions").document("${user.email}").setData({"github":controller.text});
                    }
                  }),
            ),

          ],
        ),
      ),
    );
  }

   getUser() async{
    user=await auth.currentUser();
   }
}
