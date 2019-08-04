import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Submissions extends StatefulWidget {
  String documentSnapshot;

  Submissions(this.documentSnapshot);

  @override
  _SubmissionsState createState() => _SubmissionsState();
}

class _SubmissionsState extends State<Submissions> {
  Stream<QuerySnapshot> streamSubscription;

  @override
  void initState() {
    super.initState();
    streamSubscription=Firestore.instance.collection("Projects").document("${widget.documentSnapshot}").collection("Submissions").snapshots();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Submissions",style: TextStyle(
          fontSize: 30.0,
          fontFamily: 'ButterflyKids',
        ),),
        backgroundColor: Colors.black,
      ),
      backgroundColor: Colors.blueGrey.shade100,
      body: streamSubscription!=null?StreamBuilder(
        stream: Firestore.instance.collection("Projects").document("${widget.documentSnapshot}").collection("Submissions").snapshots(),
          builder: (BuildContext c,stream){
          if(stream?.data!=null){
            QuerySnapshot querySnapshot=stream.data;
            List<DocumentSnapshot> documentSnapshotList=querySnapshot.documents;
            print(documentSnapshotList[0].data);
            return ListView.builder(
                itemCount: documentSnapshotList.length,
                itemBuilder: (BuildContext c,int position){
              return ListTile(
                title: Text("${documentSnapshotList[position].documentID}: ${documentSnapshotList[position].data["github"]}"),
              );
            });
          }else{
            return Container(height: 0.0,width: 0.0,);
          }
          }
      ):Container(
        child: Text("No submissions yet!",
          style: TextStyle(color: Colors.white,fontSize: 20.0,fontStyle: FontStyle.italic,fontWeight: FontWeight.bold),),
      ),
    );
  }
}
