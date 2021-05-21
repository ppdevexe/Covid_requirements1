import 'package:covid_requirements/firebaseservices/database.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:covid_requirements/models/users.dart';

class AuthService{
  final FirebaseAuth _auth =FirebaseAuth.instance;
 // create user object
  Users _userFromFirebaseUser(User user1){
  return user1 != null ? Users(uid:user1.uid): null;
  }
  // auth changes for stream
  Stream<Users> get user {
    return _auth.authStateChanges().map((User user) => _userFromFirebaseUser(user));
  }
  //sign in anonymously
  Future SignInAnon() async {

    try{
     UserCredential result=await _auth.signInAnonymously();
     User user1=result.user;
     return _userFromFirebaseUser(user1);
     return user1;
     print(result);
     print(user1);
    }
    catch(e)
    {
      print('the error occured is'+e.toString());
    }
}
  //sign in with e mail and password
  Future signinWithEmailAndPassword(String email,String password)async{
    try{
      UserCredential result =await _auth.signInWithEmailAndPassword(email: email, password: password);
      User user=result.user;
      //create a new document for the user
      //await Database(uid:user.uid).updateUserData(1);
      return _userFromFirebaseUser(user);
    }
    catch(e) {
      print(e.toString());
      return null;
    }
  }
  //Register in with email and password
  Future registerWithEmailAndPassword(String email,String password)async{
    try{
      UserCredential result =await _auth.createUserWithEmailAndPassword(email: email, password: password);
      User user=result.user;
      return _userFromFirebaseUser(user);
  }
  catch(e) {
  print(e.toString());
  return null;
  }
  }
  //logout
  Future signOut() async{
    try{
      return await _auth.signOut();
    }
    catch(e){
      print(e.toString());
      print(null);

    }
  }

}