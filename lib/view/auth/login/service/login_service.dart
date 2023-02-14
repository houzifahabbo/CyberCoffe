import 'package:coffee/database.dart';
import 'package:coffee/view/auth/login/viewmodel/login_view_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:coffee/models/user.dart';
///Pull the data from the json file with a delay of 2 seconds and get the data on the viewmodel side.

class LoginService {

  final FirebaseAuth _auth = FirebaseAuth.instance;

  UserFb? _userFromFirebase(User? user){
    return user != null ? UserFb(uid:user.uid) : null;
  }

  Stream <UserFb?> get user{
    return _auth.authStateChanges()
        .map(_userFromFirebase);
  }

  Future login(String email,String password) async {
    try{
      UserCredential result = await _auth.signInWithEmailAndPassword(email: email, password: password);
      User? user = result.user;
      return _userFromFirebase(user!);
    }catch(e){
      print(e.toString());
      return null;
    }
  }

  Future register(String email,String password) async {
    try{
      UserCredential result = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      User? user = result.user;
      await DataBaseService(uid: user?.uid).updateUserData('uFName', 'uLName', '0', '0000000000');
      return _userFromFirebase(user!);
    }catch(e){
      print(e.toString());
      return null;
    }
  }

  Future signInAnon() async{
    try{
      UserCredential result = await _auth.signInAnonymously();
      User? user = result.user;
      return _userFromFirebase(user!);
    }catch(e){
      print(e.toString());
      return null;
    }
  }

  Future signOut() async{
    try{
      return await _auth.signOut();
    }catch(e){
      print(e.toString());
      return null;
    }
  }

}