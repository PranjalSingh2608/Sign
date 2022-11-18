import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sign_lang/pages/ResetPassword.dart';
import 'package:sign_lang/pages/Signup.dart';
import 'package:sign_lang/pages/login.dart';
import 'package:sign_lang/utils/routes.dart';
import 'package:sign_lang/views/Home_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.light,
        primarySwatch: Colors.blue,
        textTheme: GoogleFonts.latoTextTheme(
          Theme.of(context).textTheme.apply(
                bodyColor: Colors.black,
              ),
        ),
      ),
      initialRoute: '/home',
      routes: {
        MyRoutes.HomeRoute: ((context) => Home_View()),
        MyRoutes.LoginRoute: ((context) => LoginPage()),
        MyRoutes.ResetpasswordRoute:(context) => ResetPassword(),
        MyRoutes.SignupRoute:(context) => SignUp(),
      },
    );
  }
}
