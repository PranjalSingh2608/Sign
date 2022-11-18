import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_launcher_icons/xml_templates.dart';
import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sign_lang/utils/routes.dart';
import 'package:sign_lang/views/Home_view.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String name = "";
  bool changebutton = false;
  final _formkey = GlobalKey<FormState>();

  Future<FirebaseApp>? _firebaseapp;
  TextEditingController emails = TextEditingController();
  TextEditingController password = TextEditingController();
  bool isLoading = false;

  void inistate() {
    super.initState();
    _firebaseapp = Firebase.initializeApp();
  }

  movetoHomePage(BuildContext context) async {
    if (_formkey.currentState!.validate()) {
      setState(() {
        changebutton = true;
      });
      await Future.delayed(Duration(seconds: 1));
      await Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) {
        return Home_View();
      }));
      setState(() {
        changebutton = false;
      });
    }
  }

  movetoResetPassword(BuildContext context) async {
    await Future.delayed(Duration(seconds: 1));
    await Navigator.pushNamed(context, MyRoutes.ResetpasswordRoute);
    setState(() {
      changebutton = false;
    });
  }

  movetoSignUp(BuildContext context) async {
    await Future.delayed(Duration(seconds: 1));
    await Navigator.pushNamed(context, MyRoutes.SignupRoute);
    setState(() {
      changebutton = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Form(
            key: _formkey,
            child: SingleChildScrollView(
                child: Center(
              child: Column(
                children: [
                  SizedBox(
                    height: 30,
                  ),
                  SizedBox(
                    height: 250,
                    width: 250,
                    child: Lottie.asset('assets/lottie/Login.json'),
                  ),
                  SizedBox(
                    height: 30,
                  )
                  
                ],
              ),
            ))),
      ),
    );
  }
}
