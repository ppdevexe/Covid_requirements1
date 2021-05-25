import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
class Provide extends StatefulWidget {
  @override
  _ProvideState createState() => _ProvideState();
}

class _ProvideState extends State<Provide> {
  Map data;
  final String _collection = 'Covid Requirement details';
  final FirebaseFirestore _fireStore = FirebaseFirestore.instance;
  @override
  /*fetchdata(){
    CollectionReference collectionreference = FirebaseFirestore.instance.collection('Covid Requirement details');
    collectionreference.snapshots().listen((snapshot){
      setState(() {
        data=snapshot.document[0].data;
      });
    });


    getData() async {
      return await _fireStore.collection(_collection).get();
    }

    getData().then((val){
      if(val.documents.length > 0){
        print(val.documents[0].data["field"]);
      }
      else{
        print("Not Found");
      }
    });

  }*/
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title:Text('Requirements Needed')
      ),
      body:StreamBuilder(
        stream: FirebaseFirestore.instance.collection('Covid Requirement details').snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          return ListView.builder(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            itemCount: 1,
            /*children: snapshot.data.docs.map((document) {
              return Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[ Text(document['Requirement'],style: TextStyle(fontSize: 20.0,fontWeight:FontWeight.bold),),
                   Text(document['Quantity'],style:TextStyle(fontSize: 20.0,fontWeight:FontWeight.bold),)],
              );
            }).toList(),*/
            itemBuilder: (BuildContext context,int index) {
              return  Card(
                elevation: 8.0,
                margin: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
                child: Container(
                  decoration: BoxDecoration(color: Colors.cyan),
                  child: ListTile(
                    contentPadding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),

                    title: Column(
                      children: snapshot.data.docs.map((document) {
                        return Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[ Text(document['Requirement'],style: TextStyle(fontSize: 20.0,fontWeight:FontWeight.bold),),
                            Text(document['Quantity'],style:TextStyle(fontSize: 20.0,fontWeight:FontWeight.bold),)],
                        );
                      }).toList(),
                    )
                    ,
// subtitle: Text("Intermediate", style: TextStyle(color: Colors.white)),


//trailing:
//Icon(Icons.keyboard_arrow_right, color: Colors.white, size: 30.0)
                  ),
                ),
              );
            },
          );
        },
      ),);
  }
}
