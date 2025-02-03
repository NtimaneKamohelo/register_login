import 'package:flutter/material.dart';
import 'package:register_login/screens/register_screen.dart';
import 'package:register_login/utilities_widgets/button_utils.dart';

import '../utilities_widgets/textfield_utils.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  static const String id = '/LoginScreen';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  //For controllers
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold( 
      appBar: AppBar(
        centerTitle: true,
        title: Text('Login'),
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
                hintText: 'Email', 
                suffixIcon: Icon(Icons.abc), 
                textEditingController: emailController,
              ).usernameTextField(),
        
              //Password
              TextFieldUtils(
                prefixIcon: Icon(Icons.lock),
                suffixIcon: Icon(Icons.remove_red_eye),
                hintText: 'Password', 
                textEditingController: passwordController,
              ).passwordTextField(),
        
              //Forgot Password
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    margin: EdgeInsets.only(right: 14),
                    child: RegisterLoginButton(
                      onPressed: () {  }, 
                      btnText: 'Forgot Password?').registerTextButton(),
                  )
                ],
              ),
        
              //Login Button
              RegisterLoginButton(
                onPressed: () { } , 
                btnText: 'LOGIN'
              ).mainButton(),
        
              //Google login button
              RegisterLoginButton(
                onPressed: () {}, 
                btnText: 'Login using Google'
              ).mediaButton('assets/icons/google-login-icon.png'),
        
              //FaceBook Login Button
              RegisterLoginButton(
                onPressed: () {}, 
                btnText: 'Login using Facebook'
              ).mediaButton('assets/icons/facebook-login-icon.png'),
        
        
              const SizedBox(),
              RegisterLoginButton(
                onPressed: () { 
                  Navigator.of(context).pushNamed(RegisterScreen.id);
                 }, 
                btnText: 'Don\'t you have an account? Register'
              ).registerTextButton(),  
            ],
          
          ),
        ),
      ),
    );
  }
}