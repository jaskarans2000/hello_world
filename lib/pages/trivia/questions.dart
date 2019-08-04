import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:helloworldofficial/pages/trivia/score_screen.dart';

class Questions extends StatefulWidget {
  @override
  _QuestionsState createState() => _QuestionsState();
}

class _QuestionsState extends State<Questions> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  FirebaseAuth auth=FirebaseAuth.instance;

  final formKey= GlobalKey<FormState>();
  FirebaseUser user;
  List<String> answers=[];
  int i;
  int score=0;
  final startTime = DateTime(2019, 8, 14, 21, 00);
  final endTime = DateTime(2019, 8, 14, 22, 30);
  @override
  void initState() {
    super.initState();
    setState(() {
      i=0;
      answers.insert(i, "");
    });
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController controller=TextEditingController();
    return WillPopScope(
      onWillPop: backPressed,
      child: Scaffold(
        key: _scaffoldKey,
        appBar:AppBar(
          title: Text(
          'Trivia',
          style: TextStyle(
          fontSize: 30.0,
          fontFamily: 'ButterflyKids',
      ),
      ),
          actions: <Widget>[
            MaterialButton(
                child: Text("Submit",style: TextStyle(
                  fontSize: 30.0,
                  fontFamily: 'ButterflyKids',
                  color: Colors.white
                ),),
                onPressed: (){handleSubmit();})
          ],
          backgroundColor: Colors.black,
      ),
      body:SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: StreamBuilder(
            stream: Firestore.instance.collection("trivia").snapshots(),
            builder: (c,stream){
              if(stream.data!=null){
              QuerySnapshot querySnapshot=stream.data;
              List<DocumentSnapshot> documentSnapshotList=querySnapshot?.documents;
              int length=documentSnapshotList.length;
              DocumentSnapshot documentSnapshot=documentSnapshotList[i];
              return SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text("Q${i+1}: ${documentSnapshot.data['question'].toString().replaceAll("n782", "\n")}",style: TextStyle(fontSize: 20.0),),
                      Form(
                        key: formKey,
                        child: TextFormField(
                          controller: controller,
                          decoration: InputDecoration(
                              labelText: "Answer",
                              labelStyle: TextStyle(fontWeight: FontWeight.bold)
                          ),
                          onEditingComplete:()=> formKey.currentState.save(),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top:20.0,left: 20.0),
                        child: Row(
                          children: <Widget>[
                            i>0?IconButton(icon: Icon(Icons.arrow_back_ios), onPressed: (){
                              setState(() {
                                i=i-1;
                              });
                            }):Container(width: 0.0,height: 0.0,),
                            Padding(
                              padding: const EdgeInsets.only(left:8.0),
                              child: MaterialButton(
                                  color: Colors.black,
                                  child: Text("Save",style: TextStyle(color: Colors.white),),
                                  onPressed:(){
                                    _scaffoldKey.currentState.showSnackBar(
                                        SnackBar(
                                          content: Text('Answer Saved'),
                                          duration: Duration(seconds: 3),
                                        ));
                                    final currentTime = DateTime.now();
                                    if(currentTime.isAfter(startTime) && currentTime.isBefore(endTime)){
                                    if(answers[i]!="done"){
                                   if(documentSnapshot.data['answer'].toString().toUpperCase()==controller.text.toUpperCase()){
                                     answers.insert(i, "done");
                                     setState(() {
                                       score=score+10;
                                     });
                                   }}
                                  }
                                  else{
                                    handleSubmit();
                                    }
                                  }),
                            ),
                            i<length-1?Padding(
                              padding: const EdgeInsets.only(left:8.0),
                              child: IconButton(icon: Icon(Icons.arrow_forward_ios), onPressed: (){
                                setState(() {
                                  i=i+1;
                                });
                              }),
                            ):Container(width: 0.0,height: 0.0,)
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              );
              }
              else{
              return Container(height: 0.0,width: 0.0,);}
            })
      ),
      ),
    );
  }

   handleSubmit() async {
    user=await auth.currentUser();
    Firestore.instance.collection("trivia").document("result").setData({user.email:score},merge: true);
    Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext c){
      return ScoreScreen(score);
    }));
   }

  Future<bool> backPressed() {
    return showDialog(
        context: context,
        builder: (context)=>AlertDialog(
          title: Text("Do you really want to exit the trivia?"),
          actions: <Widget>[
            FlatButton(onPressed:()=> Navigator.pop(context,false), child: Text("No")),
            FlatButton(onPressed:()=> handleSubmit(), child: Text("Yes"))
          ],
        ));
  }
}
