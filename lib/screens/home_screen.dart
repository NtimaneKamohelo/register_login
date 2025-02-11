import 'package:flutter/material.dart';
import 'package:register_login/Services/authentication.dart';
import 'package:register_login/screens/login_screen.dart';
import 'package:register_login/utilities_widgets/button_utils.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static String id = '/HomeScreen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Congratulations\nYou have successfully Login",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25,
              ),
            ),
            RegisterLoginButton(
              onPressed: ()  async{
                await AuthServices().signOut();
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