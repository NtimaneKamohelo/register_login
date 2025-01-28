import 'package:flutter/material.dart';

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
          children: [
            TextFieldUtils().mainTextField(),
            
          ],
        
        ),
      ),
    );
  }
}