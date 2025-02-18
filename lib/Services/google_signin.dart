import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:register_login/screens/home_screen.dart';
import 'package:register_login/screens/login_screen.dart';
import 'package:register_login/screens/register_screen.dart';

class GoogleSigninProvider extends ChangeNotifier  {

  final googleSignIn = GoogleSignIn();

  GoogleSignInAccount? _user;

  GoogleSignInAccount get user => _user!;

  Future googleLogin(BuildContext context) async {
    try{
      final googleUser = await googleSignIn.signIn();
      if (googleUser == null) return;
      _user = googleUser;

      final googleAuth = await googleUser.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken:  googleAuth.idToken,
      );

      UserCredential userCredential = 
        await FirebaseAuth.instance.signInWithCredential(credential);
      User? user = userCredential.user;

      if (userCredential.additionalUserInfo?.isNewUser ?? false) {
        //Navigate to the sign-up completion screen
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => LoginScreen(),),
        );
      } else {
        //Navigate to the homescreen
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => HomeScreen())
        );
      }
    } catch (e) {
      print(e.toString());
    }
    notifyListeners();
  }

  Future<void> signOut() async {
    await googleSignIn.disconnect();
    FirebaseAuth.instance.signOut();
  }

}