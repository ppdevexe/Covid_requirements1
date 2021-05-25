import 'package:covid_requirements/Provide.dart';
import 'package:covid_requirements/homepage.dart';
import 'package:covid_requirements/need.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:covid_requirements/authenticate/authenticate.dart';
import 'package:covid_requirements/wrapper/wrapper.dart';
import 'package:covid_requirements/firebaseservices/auth.dart';
import 'package:covid_requirements/models/users.dart';
import 'package:firebase_core/firebase_core.dart';




void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}
class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<Users>.value(
      value:AuthService().user,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: new ThemeData(primaryColor: Color.fromRGBO(58, 66, 86, 1.0)),
        home:Wrapper(),
        routes: {
        '/homepage':(context)=>Homepage(),
          '/need':(context)=>Need(),
          '/provide':(context)=>Provide(),
        }
        ,

      ),
    );
  }
}


