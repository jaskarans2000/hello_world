import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AddProject extends StatefulWidget {
  @override
  _AddProjectState createState() => _AddProjectState();
}
class ProjectDetails{
  String title="";
  String description="";
  String mentor="";
}

class _AddProjectState extends State<AddProject> {
  final GlobalKey<FormState> Formkey=GlobalKey<FormState>();
  ProjectDetails projectDetails=ProjectDetails();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Project", style: TextStyle(
          fontSize: 30.0,
          fontFamily: 'ButterflyKids',
        ),),
        backgroundColor: Colors.black,
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
                        labelText: "Enter project title",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(29),
                            gapPadding: 3.3
                        )
                    ),
                    validator: (value){
                      if(value.isEmpty ){
                        return "Please enter valid project title";}
                      else{
                        projectDetails.title=value;
                      }
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                        labelText: "Enter description",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(29),
                            gapPadding: 3.3
                        ),
                    ),
                    validator: (value){
                      if(value.isEmpty ){
                        return "Please enter valid description";}
                      else{
                        projectDetails.description=value;}
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                        labelText: "Enter project mentor",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(29),
                            gapPadding: 3.3
                        )
                    ),
                    validator: (value){
                      if(value.isEmpty ){
                        return "Please enter valid mentor name";}
                      else{
                        projectDetails.mentor=value;}
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
                          {Firestore.instance
                              .collection('Projects')
                              .document("${projectDetails.title}")
                              .setData( {"Description":projectDetails.description,
                            "Mentor":projectDetails.mentor,
                            }, merge: true);
                          Navigator.of(context).pop();
                          }}
                        Navigator.of(context).pop();
                      },
                      minWidth: 200.0,
                      height: 42.0,
                      child: Text(
                        'Add',
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
      ) ,
    );
  }
}
