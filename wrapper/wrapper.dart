import 'file:///F:/FUEL_CELL/covid_requirements/lib/authenticate/authenticate.dart';
import 'package:covid_requirements/models/users.dart';
import 'package:covid_requirements/homepage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
class Wrapper extends StatefulWidget {
  @override
  _WrapperState createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {

  @override
  Widget build(BuildContext context) {
    //return either home or authenticate
    final user = Provider.of<Users>(context);
    if (user == null) {
      return Authenticate();
    }
    else {
      return Homepage();
    }
  }
}
