import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
class Need extends StatefulWidget {
  @override
  _NeedState createState() => _NeedState();
}

class _NeedState extends State<Need> {
  String Requirement;
  String Quantity;
  Map data;
  @override
  addData() {
    Map<String, dynamic> Requirements = {
      "Requirement": Requirement,
      "Quantity": Quantity,
    };

    CollectionReference collectionreference = FirebaseFirestore.instance
        .collection('Covid Requirement details');
    collectionreference.add(Requirements);
  }

  void Alert(BuildContext context) {
    var alertdialog = AlertDialog(
      title: Text('You have successfully submitted your requirement .Your needs will be addressed appropriately'),
      actions: [
      ],
    );
    showDialog(context: context, builder:(BuildContext context){
      return alertdialog;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title:Text('Services Needed')),
      body:Container(
          margin: EdgeInsets.all(10.0),
          child:Column(
        children: <Widget>[
          TextFormField(
            decoration: InputDecoration(hintText: 'Enter requirement'),
            validator: (value)=>value.isEmpty ?  'please enter a valid requirement': null,
            onChanged: (value){
              setState((){
                Requirement=value;

              });
            },
          ),
          SizedBox(height: 20),
          TextFormField(
            decoration: InputDecoration(hintText: 'Enter the description of the need'),
            validator: (value)=>value.isEmpty ?  'please enter quantity and specify whether quantity is in numbers or other measures': null,
            onChanged: (value){
              setState((){
                Quantity=value;
              });
            },
          ),
          SizedBox(height: 20),
          ElevatedButton(onPressed: (){
            addData();
            Alert(context);
            print('executed');
            Navigator.pop(context, '/homepage');
            }, child: Text('Submit'))
        ],
      ))
    );

  }
}
