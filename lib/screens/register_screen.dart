import 'package:flutter/material.dart';
import 'package:register_login/screens/login_screen.dart';

import '../utilities/button_utils.dart';
import '../utilities/textfield_utils.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  static const String id = '/RegisterScreen';

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Register'),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
        
              //Username-email
              TextFieldUtils(
                prefixIcon: Icon(Icons.person),
                hintText: 'Username', 
                suffixIcon: Icon(Icons.abc)
              ).usernameTextField(),
        
              //Password
              TextFieldUtils(
                prefixIcon: Icon(Icons.lock),
                suffixIcon: Icon(Icons.remove_red_eye),
                hintText: 'Password'
              ).passwordTextField(),

              // confirm Password
              TextFieldUtils(
                prefixIcon: Icon(Icons.lock),
                suffixIcon: Icon(Icons.remove_red_eye),
                hintText: 'Confirm Password'
              ).passwordTextField(),
        
    
        
              //Login Button
              RegisterLoginButton(
                onPressed: () { } , 
                btnText: 'Register'
              ).mainButton(),
        
              //Google login button
              RegisterLoginButton(
                onPressed: () {}, 
                btnText: 'Register using Google'
              ).mediaButton('assets/icons/google-login-icon.png'),
        
              //FaceBook Login Button
              RegisterLoginButton(
                onPressed: () {}, 
                btnText: 'Register using Facebook'
              ).mediaButton('assets/icons/facebook-login-icon.png'),
        
        
              const SizedBox(),
              RegisterLoginButton(
                onPressed: () { 
                  Navigator.of(context).pushNamed(LoginScreen.id);
                 }, 
                btnText: 'Already have an account? LOGIN'
              ).registerTextButton(),
        
        
              
            ],
          
          ),
        ),
      ),

    );
  }
}