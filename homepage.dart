import 'package:covid_requirements/firebaseservices/auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:covid_requirements/authenticate/authenticate.dart';

class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  int _radiolisttilevalue;
  final AuthService _auth2=AuthService();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _radiolisttilevalue = 0;
  }

  set_radiolisttilevalue(int val) {
    setState(() {
      _radiolisttilevalue = val;
    });
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      backgroundColor: Colors.grey[700],
      appBar:AppBar(
           title:Text('Homepage'),
          actions: <Widget>[ElevatedButton.icon(onPressed: ()async{

            await _auth2.signOut();

          }, icon: Icon(Icons.account_box), label: Text('Logout'))],
      ),
      body:Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,

          children: <Widget>[
          Row(mainAxisAlignment: MainAxisAlignment.center,
              children:[Card(color:Colors.cyan,elevation: 2.0,child:RaisedButton.icon(onPressed: (){
                Navigator.pushNamed(context, '/need');
              }, icon:Icon(Icons.add_box_outlined), label:Text('NEED'))),]),
            Row(mainAxisAlignment: MainAxisAlignment.center,
                children:[Card(color:Colors.cyan,elevation: 2.0,child:RaisedButton.icon(onPressed: (){
                  Navigator.pushNamed(context, '/provide');
                }, icon:Icon(Icons.add_box_outlined), label:Text('PROVIDE'))),]),

        ],
      ),

    ));
  }
}
