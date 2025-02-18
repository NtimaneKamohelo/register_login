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
    final user = FirebaseAuth.instance.currentUser!;
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            /**const Text("Congratulations\nYou have successfully Login",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25,
              ),
            ),*/
            CircleAvatar(
              radius: 40,
              backgroundImage: NetworkImage(user.photoURL!),
            ),
            SizedBox(height: 8,),
            Text(
              'Name: ' + user.displayName!,
            ),
            SizedBox(height: 8,),
            Text(
              'email: ' + user.email!,
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