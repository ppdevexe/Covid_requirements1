//import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
/*class Database{
  //inverter data handler
  
  final String uid;
  Database({this.uid});
  final CollectionReference invdata = FirebaseFirestore.instance.collection('inverterdata');
  Future updateUserData(int ledstate)async{
    return await invdata.doc(uid).set({
      'ledstate':ledstate
    });
  }
}*/
final databaseRef = FirebaseDatabase.instance.reference(); //database reference object

void addData(int data) {
  databaseRef.push().set({'name': data, 'comment': 'Led state'});
}
void replaceData(int data){
  databaseRef.push().set({'name': data, 'comment': 'Led state'});
}