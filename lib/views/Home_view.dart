import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';

class Home_View extends StatefulWidget {
  const Home_View({super.key});

  @override
  State<Home_View> createState() => _Home_ViewState();
}

class _Home_ViewState extends State<Home_View> {
  File? image;
  Future pickImage(ImageSource channel) async {
    try {
      final image = await ImagePicker().pickImage(source: channel);
      if (image == null) {
        return AssetImage("assets/images/defaultprofile.png");
      } else {
        final imageTemp = File(image.path);
        setState(() => this.image = imageTemp);
      }
    } on PlatformException catch (e) {
      Fluttertoast.showToast(
          msg: "Failed to pick image:$e",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 2,
          backgroundColor: Color.fromARGB(255, 24, 189, 234),
          textColor: Colors.white);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Form(
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
          children: [
            imageProfile(),
          ],
        ),
      ),
    );
  }

  Widget imageProfile() {
    return Center(

    );
  }
}
