import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tflite/tflite.dart';

class Home_View extends StatefulWidget {
  const Home_View({super.key});

  @override
  State<Home_View> createState() => _Home_ViewState();
}

class _Home_ViewState extends State<Home_View> {
  File? image;
  List? _output;
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
          backgroundColor: Color.fromARGB(255, 3,218,197),
          textColor: Colors.white);
    }
  }

  loadmodel() async {
    Tflite.loadModel(
      model: "assets/model/sign_detector.tflite",
      labels: "assets/model/labels.txt",
    );
  }

  @override
  void initState() {
    super.initState();
    loadmodel();
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
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 30),
        child: Stack(
          children: [
            CircleAvatar(
              radius: 60,
              backgroundImage: image == null
                  ? AssetImage("assets/images/defaultprofile.png")
                  : FileImage(File(image!.path)) as ImageProvider,
            ),
            Positioned(
                bottom: 10,
                right: 15,
                child: InkWell(
                  onTap: () {
                    showModalBottomSheet(
                      context: context,
                      builder: ((builder) => bottomBox()),
                    );
                  },
                  child: Icon(
                    Icons.camera_alt_rounded,
                    color: Color.fromARGB(255, 24, 139, 234),
                    size: 28.0,
                  ),
                )),
          ],
        ),
      ),
    );
  }

  runModelonImage(File image) async {
    var output = await Tflite.runModelOnImage(
      path: image.path,
      numResults: 2,
      imageMean: 127.5,
      imageStd: 127.5,
      threshold: 0.5,
    );
    setState(() {
      _output = output;
    });
  }

  Widget bottomBox() {
    return Container(
      height: 120,
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 20,
      ),
      child: Column(
        children: <Widget>[
          Text(
            "Choose Profile photo",
            style: TextStyle(
              fontSize: 20.0,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
            Column(
              children: [
                IconButton(
                  icon: Icon(
                    Icons.camera_alt,
                    size: 35,
                  ),
                  onPressed: () {
                    pickImage(ImageSource.camera);
                  },
                ),
                Text("Camera"),
              ],
            ),
            SizedBox(
              width: 200,
            ),
            Column(
              children: [
                IconButton(
                  icon: Icon(Icons.image, size: 35),
                  onPressed: () {
                    pickImage(ImageSource.gallery);
                  },
                ),
                Text("Gallery"),
              ],
            ),
          ])
        ],
      ),
    );
  }
}
