import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:register_login/Services/authentication.dart';
import 'package:register_login/Services/google_signin.dart';
import 'package:register_login/screens/home_screen.dart';
import 'package:register_login/screens/login_screen.dart';
import 'package:register_login/utilities_widgets/Snack_bar.dart';

import '../utilities_widgets/button_utils.dart';
import '../utilities_widgets/textfield_utils.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  static const String id = '/RegisterScreen';

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  //For Controller
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController(); 
  //final TextEditingController confirmPasswordController = TextEditingController(); 
  bool isLoading = false;

  void dispose() {
    super.dispose;
    emailController.dispose();
    passwordController.dispose();
  }

  void registerUser() async {
    String res = await AuthServices().registerUser(
      email: emailController.text, 
      password: passwordController.text
    );
    //If registering is successful, User has been created and navigate to the next Screen
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

              // confirm Password
              /**TextFieldUtils(
                prefixIcon: Icon(Icons.lock),
                suffixIcon: Icon(Icons.remove_red_eye),
                hintText: 'Confirm Password', 
                textEditingController: confirmPasswordController,
              ).passwordTextField(),*/
        
              //Register Button
              RegisterLoginButton(
                onPressed: registerUser, 
                btnText: 'Register'
              ).mainButton(),
        
              //Google login button
              RegisterLoginButton(
                onPressed: () {
                  final provider = 
                    Provider.of<GoogleSigninProvider>(context, listen: false); 
                  provider.googleLogin();
                }, 
                btnText: 'Register using Google'
              ).mediaButton(const FaIcon(FontAwesomeIcons.google, color: Colors.red)),
        
              //FaceBook Login Button
              RegisterLoginButton(
                onPressed: () {}, 
                btnText: 'Register using Facebook'
              ).mediaButton(const FaIcon(FontAwesomeIcons.facebook, color: Colors.blue)),
        
        
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