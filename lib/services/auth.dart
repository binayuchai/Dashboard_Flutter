import 'package:dashboard_flutter/services/database.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:dashboard_flutter/models/customUser.dart';
class AuthService{
  final FirebaseAuth _auth = FirebaseAuth.instance;



//create user object on Firebase's User
  CustomUser? _userFromFirebaseuser(User? user) {
    print("Custom user creations");
    return user!= null ? CustomUser(uid: user.uid) : null;

  }

//auth change user stream(response when state of authentication changes)
  Stream<CustomUser?> get user{
    return _auth.authStateChanges() .map((user){
      print('Authentication state changed ...........${user?.uid}');
      return _userFromFirebaseuser(user);

    }) //  returns user if signed in and if signout returns null
        ; // it handles both null and not null value

  }




// sign in anon
//
//   Future signInAnon() async{
//     try{
//
//       UserCredential result = await _auth.signInAnonymously();
//       User? user = result.user;
//       print("User logged in --------------------> signInAnon function");
//       return _userFromFirebaseuser(user);
//     }catch(e){
//       print("Error signing: ${e.toString()}");
//
//       return null;
//
//     }
//   }


// sign in with email and password

  Future<CustomUser?> signInWithEmailPassword(String email,String password)async{
    try{
      UserCredential result = await _auth.signInWithEmailAndPassword(email: email, password: password);
      User? user = result.user;
      return _userFromFirebaseuser(user);
    }catch(e){
      print('Sign in error: $e');
      return null;
    }
  }


// register with email and password
  Future registerWithEmailPassword(String email,String password) async{
    try{
      UserCredential result = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      User? user = result.user;
      // await DatabaseService(uid: user!.uid).updateUserData('assets/images/icons8-adobe-xd.svg', "TestData",' 01-03-2021', '4GB');

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
       await _auth.signOut();

    }catch(e){
      print(e.toString());

    }

  }

}