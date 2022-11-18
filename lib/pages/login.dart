import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_launcher_icons/xml_templates.dart';
import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sign_lang/utils/routes.dart';
import 'package:sign_lang/utils/shared.dart';
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
                    height: 40,
                  ),
                  SizedBox(
                    height: 300,
                    width: 300,
                    child: Lottie.asset('assets/lottie/Login.json'),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Text(
                    "LOGIN",
                    style: TextStyle(
                      fontSize: 28,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: FutureBuilder(
                      future: _firebaseapp,
                      builder: ((context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return CircularProgressIndicator();
                        }

                        return SingleChildScrollView(
                          child: Column(
                            children: [
                              TextFormField(
                                controller: emails,
                                decoration: InputDecoration(
                                    hintText: "Enter Email",
                                    labelText: "Email",
                                    labelStyle: TextStyle(),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    )),
                                validator: ((String? value) {
                                  if (value != null && value.isEmpty) {
                                    return "Username cannot be empty";
                                  }
                                  return null;
                                }),
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              TextFormField(
                                controller: password,
                                obscureText: true,
                                decoration: InputDecoration(
                                    hintText: "Enter Password",
                                    labelText: "Password",
                                    labelStyle: TextStyle(),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    )),
                                validator: ((String? value) {
                                  if (value != null && value.isEmpty) {
                                    return "Username cannot be empty";
                                  } else if (value!.length < 6) {
                                    return "Password need to have atleast 6 charracters";
                                  }
                                  return null;
                                }),
                              ),
                              SizedBox(
                                height: 50,
                              ),
                              InkWell(
                                onTap: (() async {
                                  try {
                                    setState(() {
                                      isLoading = true;
                                    });
                                    await FirebaseAuth.instance
                                        .signInWithEmailAndPassword(
                                            email: emails.text,
                                            password: password.text);
                                    movetoHomePage(context);
                                    setState(() {
                                      isLoading = false;
                                    });
                                  } on FirebaseAuthException catch (e) {
                                    print('failed with error code: ${e.code}');
                                    print('e.message');
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                          content: const Text(
                                              'Incorrect Password Or Email')),
                                    );
                                  }
                                  await Shared.getUserSharedPrefernces()
                                      .then((value) {
                                    setState(() {
                                      var isLogin = value;
                                    });
                                  });
                                }),
                                child: AnimatedContainer(
                                  duration: Duration(milliseconds: 500),
                                  width: changebutton ? 50 : 150,
                                  height: 50,
                                  alignment: Alignment.center,
                                  child: changebutton
                                      ? Icon(
                                          Icons.done,
                                          color: Colors.white,
                                        )
                                      : Text(
                                          'LOGIN',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 19),
                                        ),
                                  decoration: BoxDecoration(
                                    color: Color.fromARGB(255, 3, 218, 197),
                                    borderRadius: BorderRadius.circular(
                                        changebutton ? 50 : 12),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                            ],
                          ),
                        );
                      }),
                    ),
                  )
                ],
              ),
            ))),
      ),
    );
  }
}
