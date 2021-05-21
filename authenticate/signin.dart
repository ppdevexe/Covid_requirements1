import 'package:covid_requirements/firebaseservices/auth.dart';
import 'package:covid_requirements/loading.dart';
import 'package:flutter/material.dart';
import 'package:covid_requirements/homepage.dart';
class SignIn extends StatefulWidget {
  final Function toggleView;
  SignIn({this.toggleView});
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _auth=AuthService();
  final _formkey=GlobalKey<FormState>();
  bool loading = false;
  String email='';
  String password='';
  String error='';
  @override
  Widget build(BuildContext context) {
    return loading ? Loading():Scaffold(
        backgroundColor: Colors.brown[100],
        appBar: AppBar(
            elevation:1.0,
            title:Text('SignIn'),
            actions: <Widget>[
              FlatButton.icon(onPressed: (){
                widget.toggleView();
              }, icon: Icon(Icons.account_box), label: Text('Register'))
          ],


        ),
        body:Container(
            padding: EdgeInsets.symmetric(vertical: 20,horizontal:50),
            child:Form(
                key: _formkey,
                child:Column(
                  children: <Widget>[
                    SizedBox(height: 20.0,),
                    /*ElevatedButton(onPressed: () async  {
                       dynamic result = await _auth.SignInAnon();
                       if(result==null)
                       {
                         print('error signing in');
                       }
                       else {
                         print('User signed in');
                         print(result);
                       }

                    }, child:Text('SignIn'))*/
                    TextFormField(
                      decoration: InputDecoration(hintText: 'Enter e-mail'),
                      validator: (value)=>value.isEmpty ?  'please enter a valid email': null,
                      onChanged: (value){
                      setState(() => email =value);
                      },
                    ),
                    SizedBox(height: 20.0,),
                    TextFormField(
                      decoration: InputDecoration(hintText: 'Enter password'),
                      validator: (value)=>value.length<6?  'please enter a valid password with length >6 characters': null,
                      obscureText: true,
                      onChanged: (value){
                        setState(() => password =value);
                      },
                    ),
                    SizedBox(height: 20.0,),
                    ElevatedButton(

                      child: Text(
                        'Sign In'
                      ),
                      onPressed: ()async{
                        if (_formkey.currentState.validate()){
                          setState(() => loading=true);
                          dynamic result= await _auth.signinWithEmailAndPassword(email, password);


                          if (result==null){
                            setState(() {

                              error ='Error signing in';
                              loading=false;
                            });
                          }
                          else{
                          return Homepage();
                          }
                        }
                          print(email);
                          print(password);
                        }

                    ),
                    SizedBox(height: 20.0,),
                    Text(error),
                  ],
                )
            )
        )
    );
  }
}
