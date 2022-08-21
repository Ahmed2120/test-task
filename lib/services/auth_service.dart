import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthService{
  signIn(username, password) async{
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: username,
          password: password
      );
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('username', '${credential.user?.email}');
      return credential.user;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }
  }

  // checkVerifying(bool emailVerified) async{
  //   if(!emailVerified){
  //     User? user = FirebaseAuth.instance.currentUser;
  //     await user?.sendEmailVerification();
  //     print('object false');
  //     return false;
  //   }
  //   return true;
  // }
}