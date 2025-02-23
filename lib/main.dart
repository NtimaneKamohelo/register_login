import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:register_login/Services/google_signin.dart';
import 'package:register_login/screens/home_screen.dart';
import 'package:register_login/screens/login_screen.dart';
import 'package:register_login/screens/register_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (BuildContext context) => GoogleSigninProvider(),
        ),
      ],
      child: MaterialApp(
        theme: ThemeData(
          appBarTheme: AppBarTheme(
            color: Colors.purple[100],
          ),
        ),
        debugShowCheckedModeBanner: false,
        //When we restart the application it requests that we login over and over
        //Below we allow it to keep the user signed in until they logout
        home: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(), 
          builder: (context, snapshot){
            if(snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            }
            else if(snapshot.hasData){
              return HomeScreen();
            } else if (snapshot.hasError){
              return Center(child: Text('Something went Wrong!'));
            }
            else {
              return LoginScreen();
            }
          }),
        //LoginScreen()
        //Routes
        routes: {
          RegisterScreen.id: (context) => RegisterScreen(),
          LoginScreen.id: (context) => LoginScreen(),
          HomeScreen.id: (context) => HomeScreen(),
        },
      ),
    );
    
    
  }
}
