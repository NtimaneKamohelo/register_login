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
      child: OutlinedButton(
        onPressed: onPressed,
        style: OutlinedButton.styleFrom(
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

}