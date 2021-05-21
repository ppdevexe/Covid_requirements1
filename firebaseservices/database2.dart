import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import  'package:firebase_core/firebase_core.dart';
final databaseReference = FirebaseDatabase.instance.reference();
final myController= TextEditingController();
DatabaseReference ledcontrol(bool state){
 var ledstate=databaseReference.child('ledstate/').push();
 //ledstate.set(value);
}