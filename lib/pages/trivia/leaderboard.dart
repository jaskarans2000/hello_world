import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
class LeaderBoard extends StatefulWidget {
  @override
  _LeaderBoardState createState() => _LeaderBoardState();
}

class _LeaderBoardState extends State<LeaderBoard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Leaderboard",style: TextStyle(
        fontSize: 30.0,
        fontFamily: 'ButterflyKids',
        color: Colors.white
        ,),
      ),backgroundColor: Colors.black,),
      body: StreamBuilder(
        stream: Firestore.instance.collection("trivia")?.document("result")?.snapshots(),
          builder:(BuildContext c,stream){
          if(stream.data!=null){
          DocumentSnapshot documentSnapshot=stream.data;
          Map<String,dynamic> data=documentSnapshot.data;
          Map<String,String> datas;
          List keys=documentSnapshot.data?.keys?.toList();
          List values=documentSnapshot.data?.values?.toList();
          return ListView.builder(
              itemCount: keys!=null?keys.length:0,
              itemBuilder:(BuildContext c,int position){
                sort(keys,values);
                return ListTile(
                  title: Text("${keys[position]}"),
                  trailing: Text("${values[position]}"),
                );
          });
          }else{
            return Container(height: 0.0,width: 0.0,);
          }}),
    );
  }

   sort(List keys, List values) {
     for(int i=0;i<(keys!=null?keys.length:0);i++){
       String email=keys[i];
       int value=values[i];
       for (int j = 0; j < keys.length-i-1; j++)
         if (values[j] > values[j+1])
         {
           int temp=values[j];
           values[j]=values[j+1];
           values[j+1]=temp;
           String str=keys[j];
           keys[j]=keys[j+1];
           keys[j+1]=str;
         }
     }
   }
}
