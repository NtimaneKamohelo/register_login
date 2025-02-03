import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class TextFieldUtils {
  Widget prefixIcon;
  Widget suffixIcon;
  final String hintText;

  final TextEditingController textEditingController;
  final bool isPass;
  //final TextInputType textInputType;

  TextFieldUtils({
    required this.prefixIcon,
    required this.suffixIcon,
    required this.hintText,
    required this.textEditingController, 
    this.isPass = false, 
    //required this.textInputType, 
  });
  
  //Email Username
  Container usernameTextField() {
    return Container(
      decoration: const BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 60,

          )
        ]
      ),
      margin: EdgeInsets.only(top: 40,left: 20, right: 20),
      child: TextField(
        obscureText: isPass,
        controller: textEditingController,
        decoration: InputDecoration(
          fillColor: Colors.blue, 
          contentPadding: EdgeInsets.all(10),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5)
          ), 
          prefixIcon: prefixIcon,
          hintText: hintText,
          hintStyle: TextStyle(
            color: Colors.grey[400],
            fontSize: 14,
          ),
        ), 
      ),

    );
  }

  Container passwordTextField() {
    return Container(
      decoration: const BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 60,

          )
        ]
      ),
      margin: EdgeInsets.only(top: 40,left: 20, right: 20),
      child: TextField(
        controller: textEditingController,
        obscureText: isPass,
        decoration: InputDecoration(
          fillColor: Colors.blue, 
          contentPadding: EdgeInsets.all(10),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5)
          ), 
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon,
          hintText: hintText,
          hintStyle: TextStyle(
            color: Colors.grey[400],
            fontSize: 14,
          ),
        ), 
      ),

    );
  }

}