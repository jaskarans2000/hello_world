import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../main.dart';

class ProjectExplained extends StatefulWidget {
  String title;
  String mentor;
  String description;

  ProjectExplained(this.title,this.mentor,this.description);

  @override
  _ProjectExplainedState createState() => _ProjectExplainedState();
}

class _ProjectExplainedState extends State<ProjectExplained> {

  TextEditingController controller=TextEditingController();

  @override
  void initState() {
    super.initState();
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
      body:widget.mentor!=null? SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("Mentor: ${widget.mentor}\n\nDescription: ${widget.description}",style: TextStyle(fontSize: 20.0),),
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
      ):Container(height: 0.0,width: 0.0,),
    );
  }
}
