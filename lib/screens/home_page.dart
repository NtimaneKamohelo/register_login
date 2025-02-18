import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:register_login/screens/home_screen.dart';
import 'package:register_login/screens/login_screen.dart';
import 'package:register_login/screens/register_screen.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      /**body: StreamBuilder(
        //Everytime the user login or logout the registerscreen will be rebuilt
        stream: FirebaseAuth.instance.authStateChanges(), 
        builder: (context, snapshot){

          if(snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          else if (snapshot.hasData) {
            return HomeScreen();
          }
          else if (snapshot.hasError) {
            return Center(child: Text('Something Went Wrong!'),);
          } 
          else {
            return RegisterScreen();
          }

          
        },
      ),*/
    );
  }
}