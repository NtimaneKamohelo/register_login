import 'package:flutter/material.dart';

class RegisterLoginButton {

  final VoidCallback onPressed; //Function to handle button pressed
  final String btnText; //Widget to define the buttons content

  RegisterLoginButton({
    required this.onPressed,
    required this.btnText
  });

  Container mainButton() {
    return Container(
      margin: EdgeInsets.all(40),
      //decoration: BoxDecoration(),
      child: OutlinedButton(
        onPressed: onPressed,
        style: OutlinedButton.styleFrom(
          padding: EdgeInsets.symmetric(horizontal: 70),
          backgroundColor: Colors.purple[100],   
        ), 
        child: Text(
          btnText,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black
          ),
        ),
      ),
    );
  }

  TextButton registerTextButton() {
    return TextButton(
      onPressed: onPressed, 
      child: Text(
        btnText,
        style: TextStyle(
          color: Colors.black,
        ),
      ),
    );
  }

}