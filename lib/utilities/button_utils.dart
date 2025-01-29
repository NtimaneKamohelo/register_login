import 'package:flutter/material.dart';

class RegisterLoginButton {

  final VoidCallback onPressed; //Function to handle button pressed
  final String btnText;
  //Widget prefixIcon;
   //Widget to define the buttons content

  RegisterLoginButton({
    required this.onPressed,
    required this.btnText,
    //required this.prefixIcon
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

  //Social media login
  Container mediaButton(Icon prefixIcon) {
    return Container(
      margin: EdgeInsets.only(top: 15, left: 40, right: 40),
      //decoration: BoxDecoration(),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.symmetric(horizontal: 70),
          backgroundColor: Colors.grey[100],   
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10)
          )
        ), 
      
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            prefixIcon,
            Text(
              btnText,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black
              ),
            ),
          ],
        ),
      ),
    );
  }
  

}