import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
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
    return MaterialApp(
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          color: Colors.purple[100],
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: LoginScreen(),

      //Routes
      routes: {
        RegisterScreen.id: (context) => RegisterScreen(),
        LoginScreen.id: (context) => LoginScreen(),
        HomeScreen.id: (context) => HomeScreen(),
      },
    );
  }
}
