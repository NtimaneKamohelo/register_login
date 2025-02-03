import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthServices {
  //For storing data in cloud firestore
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  //For Authentication
  final FirebaseAuth _auth = FirebaseAuth.instance;

  //For Registering an account
  Future<String> registerUser ({
    required String email,
    required String password,
  }) async {
    String res = "Some error occurred";
    try{

      if(email.isNotEmpty || password.isNotEmpty) {
        //For registering a user in firebase auth with email and password.
        UserCredential credential = await _auth.createUserWithEmailAndPassword(
          email: email, 
          password: password,
        );
        //For adding user to our cloud firestore
        await _firestore.collection("users").doc(credential.user!.uid).set({
          //'name': name,
          'email': email,
          'uid': credential.user!.uid
          //Password cannot be stored in cloud firestore
        });
        res = "Success";
      }
     

    } catch (e) {
      print(e.toString());
    }
    return  res;
  }//Register authentication ends here
}

