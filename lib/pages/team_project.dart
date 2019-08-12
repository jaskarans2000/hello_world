import 'dart:async';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:helloworldofficial/pages/submissions.dart';
import 'add_project.dart';

class TeamProjects extends StatefulWidget {
  @override
  _TeamProjectsState createState() => _TeamProjectsState();
}

class _TeamProjectsState extends State<TeamProjects> {
  Firestore firestore=Firestore.instance;
  Stream<QuerySnapshot> streamSubscription;
  @override
  void initState() {
    super.initState();
    streamSubscription=Firestore.instance.collection("Projects").snapshots();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Projects",style: TextStyle(
          fontSize: 30.0,
          fontFamily: 'ButterflyKids',
          color: Colors.white
        ),),
        backgroundColor: Colors.black,
      ),
      backgroundColor: Colors.blueGrey.shade100,
      body: streamSubscription!=null?StreamBuilder(
          stream: Firestore.instance.collection("Projects").snapshots(),
          builder: (BuildContext c,stream){
            if(stream?.data!=null){
            QuerySnapshot querySnapshot=stream.data;
            List<DocumentSnapshot> documentSnapshotList=querySnapshot.documents;
            return OrientationBuilder(builder: (context,orientation){
              return GridView.count(
                scrollDirection: Axis.vertical,
                  crossAxisCount: orientation==Orientation.portrait?2:3,
                crossAxisSpacing: 2.0,
                mainAxisSpacing: 2.0,
                children: List.generate(documentSnapshotList.length, (index){
                  return GestureDetector(
                    onTap: (){
                      DocumentSnapshot documentSnapshot=documentSnapshotList[index];
                      documentSnapshot.documentID!=null?Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext c){
                        return Submissions(documentSnapshot.documentID);
                      })):{};
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey,width: 3.0),
                        borderRadius: BorderRadius.circular(25.0),
                        color: Colors.blueGrey
                      ),
                      child: Center(child: Text("${documentSnapshotList[index].documentID}",
                      style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold,fontStyle: FontStyle.italic,color: Colors.white),)),
                    ),
                  );
                }),
              );
            });
          }
            else{
            return Container(height: 0.0,width: 0.0,);
            }
          }
      ):Container(
        color: Colors.blueGrey,
        child: Center(child: Text("Coming Soon...",style: TextStyle(color: Colors.white,fontStyle: FontStyle.italic,fontWeight: FontWeight.bold,fontSize: 20.0),)),
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add,color: Colors.white,),
          backgroundColor: Colors.black,
          onPressed:(){
            Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext c){
              return AddProject();
            }));
          }),
    );
  }
}
