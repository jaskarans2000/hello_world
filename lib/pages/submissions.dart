import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:url_launcher/url_launcher.dart';

class Submissions extends StatefulWidget {
  String documentSnapshot;

  Submissions(this.documentSnapshot);

  @override
  _SubmissionsState createState() => _SubmissionsState();
}

class _SubmissionsState extends State<Submissions> {
  Stream<QuerySnapshot> streamSubscription;

  Future _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
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
            return ListView.builder(
                itemCount: documentSnapshotList.length,
                itemBuilder: (BuildContext c,int position){
              return ListTile(
                title: Text("${documentSnapshotList[position].documentID} ",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18.0),),
                subtitle: GestureDetector(
                    onTap:()=> _launchURL(documentSnapshotList[position].data["github"]),
                    child: Text("${documentSnapshotList[position].data["github"]}",style: TextStyle(color: Colors.blue),)) ,
              );
            });
          }else{
            return Container(
              child: Center(
                child: Text("No submissions yet!",
                  style: TextStyle(color:Colors.black,fontSize: 20.0,fontStyle: FontStyle.italic,fontWeight: FontWeight.bold),),
              ),
            );
          }
          }
      ):Container(
        child: Center(
          child: Text("No submissions yet!",
            style: TextStyle(color:Colors.black,fontSize: 20.0,fontStyle: FontStyle.italic,fontWeight: FontWeight.bold),),
        ),
      ),
    );
  }
}
