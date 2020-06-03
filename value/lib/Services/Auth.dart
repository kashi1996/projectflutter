import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:google_sign_in/google_sign_in.dart';

class User{
  final String uid;
  User ({@required this.uid});
}

abstract class AuthBase{                  //ABSTRACT CLASS ONLY RETURN THE INTERFACE, WE DONOT NEED TO CALL A CLASS THEN
  //THEN FUNCTION WE WILL DIRECT CALL ABSTRACT CLASS IT WILL PROVIDE ALL
  //INTERFACE WHICH WE DEFINED IN THE CLASS(SIGNINANONYMOUSLY,SIGNOUT,CURRENTUSER)
  Stream<User> get onAuthStateChanged;
  Future<User> currentUser();
  Future<User> signInAnonymously();
  Future<User> signInWithGoogle();
  Future<void> signOut();
}
class Auth implements AuthBase{

  final _fireBaseAuth=FirebaseAuth.instance;        //it is variable declaration to replace FireBaseAuth.instance from
  // every class
  @override
  Stream<User> get onAuthStateChanged{
    return _fireBaseAuth.onAuthStateChanged.map(_userFromFireBase);
  }
  User _userFromFireBase(FirebaseUser user){        // CONVERT FireBaseUser TO User(bring from update class)
    if(user == null){
      return null;
    }

    return User(uid: user.uid);
  }

  @override
  Future<User> currentUser() async{
    final returnedUser=await _fireBaseAuth.currentUser();
    return _userFromFireBase(returnedUser);
  }

  @override
  Future<User> signInAnonymously() async{
    final authResult=await _fireBaseAuth.signInAnonymously();
    return _userFromFireBase (authResult.user);
  }
//GoogleSignIn replace with final b/c it write only one time
  @override
  Future<User> signInWithGoogle() async{
    final googleSignIn = GoogleSignIn();
    final googleAccount = await googleSignIn.signIn();
    if(googleAccount != null) {
      final googleAuth = await googleAccount
          .authentication;
      if (googleAuth.accessToken != null && googleAuth.idToken != null) {
        final authResult = await _fireBaseAuth.signInWithCredential(
          GoogleAuthProvider.getCredential(
              idToken: googleAuth.idToken, accessToken: googleAuth.accessToken),
        );
        return _userFromFireBase(authResult.user);
      }
      else {

        throw PlatformException(
          code: 'ERROR_MISSIGN_GOOGLE_AUTH_TOKEN',
          message: 'Missing Goole With Token!',
        );


      }
    }


    else
      {
        throw PlatformException(
          code: 'ERROR_ANDROID_BY_USER',
          message: 'You sborted the sign in!',
        );
      }
  }

  @override
  Future<void> signOut() async{
    final googleSignIn = GoogleSignIn();
    await googleSignIn.signOut();
    await _fireBaseAuth.signOut();
  }

}