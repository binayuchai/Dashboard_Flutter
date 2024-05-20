import 'package:firebase_auth/firebase_auth.dart';
import 'package:dashboard_flutter/models/customUser.dart';
class AuthService{
  final FirebaseAuth _auth = FirebaseAuth.instance;



//create user object on Firebase's User
  CustomUser? _userFromFirebaseuser(User? user) {
    return user!= null ? CustomUser(uid: user.uid) : null;

}

//auth change user stream(response when state of authentication changes)
Stream<CustomUser?> get user{

  return _auth.authStateChanges()  //  returns user if signed in and if signout returns null
  .map((user)=>(_userFromFirebaseuser(user))); // it handles both null and not null value

}




// sign in anon
//
Future signInAnon() async{
  try{
    UserCredential result = await _auth.signInAnonymously();
    User? user = result.user;
    return _userFromFirebaseuser(user!);
  }catch(e){
   print("Error signing: ${e.toString()}");

   return null;

  }
}


// sign in with email and password


// register with email and password
  Future registerWithEmailPassword(String email,String password) async{
    try{
      UserCredential result = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      User? user = result.user;
      return _userFromFirebaseuser(user);



    }
         catch(e){
            print(e.toString());
            return null;
        }
  }

//sign out

Future signOut() async {
  try{
    return await _auth.signOut();

  }catch(e){
    print(e.toString());
    return null;
  }

  }

}