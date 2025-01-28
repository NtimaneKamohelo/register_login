import 'package:flutter/material.dart';

class TextFieldUtils {
  
  Container mainTextField() {
    return Container(
      decoration: const BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 60,

          )
        ]
      ),
      margin: EdgeInsets.all(40),
      child: TextField(
        decoration: InputDecoration(
          fillColor: Colors.blue, 
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5)
          ) 
        ),
        
      ),

    );
  }

}