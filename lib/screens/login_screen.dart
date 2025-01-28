import 'package:flutter/material.dart';
import 'package:register_login/screens/register_screen.dart';
import 'package:register_login/utilities/button_utils.dart';

import '../utilities/textfield_utils.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold( 
      appBar: AppBar(
        centerTitle: true,
        title: Text('Login'),
      ),
      body: Center(
        child: Column(
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
              onPressed: () {
                Navigator.of(context).pushNamed(RegisterScreen.id);
              } , 
              btnText: 'LOGIN'
            ).mainButton(),


            const SizedBox(),
            RegisterLoginButton(
              onPressed: () {  }, 
              btnText: 'Do you have an account? Register'

            ).registerTextButton(),


            
          ],
        
        ),
      ),
    );
  }
}