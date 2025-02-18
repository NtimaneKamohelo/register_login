import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:register_login/Services/authentication.dart';
import 'package:register_login/Services/google_signin.dart';
import 'package:register_login/screens/login_screen.dart';
import 'package:register_login/utilities_widgets/button_utils.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static String id = '/HomeScreen';
  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) {
      return Scaffold(
        body: Center(
          child: Text("No user is currently logged in"),
        ),
      );
    }
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 40,
              backgroundImage: user.photoURL != null
                ? NetworkImage(user.photoURL!)
                : null,
            ),
            SizedBox(height: 8,),
            Text(
              'Name: ' + (user.displayName ?? 'Anonymous'),
            ),
            SizedBox(height: 8,),
            Text(
              'email: ' + (user.email ?? 'No email'),
            ),

            //Log out
            RegisterLoginButton(
              onPressed: () {

                final provider = 
                  Provider.of<GoogleSigninProvider>(context, listen: false);
                provider.signOut();
                //await AuthServices().signOut();
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (context) => LoginScreen(),
                  )
                );
              },
              btnText: "Log Out",
            ).mainButton()
            
          ],
        ),
      ),
    );
  }
}