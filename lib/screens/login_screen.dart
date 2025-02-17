import 'package:flutter/material.dart';
import 'package:register_login/Services/authentication.dart';
import 'package:register_login/screens/home_screen.dart';
import 'package:register_login/screens/register_screen.dart';
import 'package:register_login/utilities_widgets/Snack_bar.dart';
import 'package:register_login/utilities_widgets/button_utils.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
  bool isLoading = false;

  @override
  void dispose() {
    super.dispose;
    emailController.dispose();
    passwordController.dispose();
  }

  void loginUsers() async {
    String res = await AuthServices().loginUser(
      email: emailController.text, 
      password: passwordController.text
    );
    //If login is successful, User has been created and navigate to the next Screen
    //Otherwise show the error message
    if(res == "Success") {
      setState(() {
        isLoading = true;
      });
      //Navigate to the nex Screen
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => HomeScreen(),
        ), 
      );
    }else {
      setState(() {
        isLoading = false;
      });
      ///Show error message
      showSnackBar(context, res);
    }

  }
  
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
                isPass: true,
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
                onPressed: loginUsers, 
                btnText: 'LOGIN'
              ).mainButton(),
        
              //Google login button
              RegisterLoginButton(
                onPressed: () {}, 
                btnText: 'Login using Google',
                
              ).mediaButton(FaIcon(FontAwesomeIcons.google, color: Colors.red)),
        
              //FaceBook Login Button
              RegisterLoginButton(
                onPressed: () {}, 
                btnText: 'Login using Facebook'
              ).mediaButton(FaIcon(FontAwesomeIcons.facebook, color: Colors.blue)),
        
        
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