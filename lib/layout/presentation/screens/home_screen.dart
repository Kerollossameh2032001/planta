import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:planta/layout/presentation/screens/result_screen.dart';

import '../../../core/global/components/navigate_to.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ImagePicker _picker = ImagePicker();
  File? image;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: 50,
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.5,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  image: image != null
                      ? DecorationImage(
                          image: FileImage(image!), fit: BoxFit.cover)
                      : const DecorationImage(
                          image: AssetImage(
                              "assets/images/home_screen_background.png"),
                          fit: BoxFit.cover),
                ),
              ),
              image==null? const Text("Taking photo to scaning...!"):const Text("Show result...!")
            ],
          ),
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,

        children: [
          FloatingActionButton(
            heroTag: '12',
            backgroundColor: Theme.of(context).primaryColor,
            child: image == null? Icon(Icons.image_outlined):Icon(Icons.qr_code_scanner_outlined,size: 45,),
            onPressed: () async {
              if(image == null){
                // Capture a photo
                final XFile? photo =
                await _picker.pickImage(source: ImageSource.gallery);
                setState(() {try{
                  image = File(photo!.path);}catch(e){}
                });
              }else {
                navigateTo(context: context,destination: ResultScreen());
              }
            },
          ),  FloatingActionButton(
            heroTag: '34',
            backgroundColor: Theme.of(context).primaryColor,
            child: image == null? Icon(Icons.camera_alt_outlined):Icon(Icons.qr_code_scanner_outlined,size: 45,),
            onPressed: () async {
              if(image == null){
                // Capture a photo
                final XFile? photo =
                await _picker.pickImage(source: ImageSource.camera);
                setState(() {

          try{
            image = File(photo!.path);}catch(e){}
                });
              }else {
                navigateTo(context: context,destination: ResultScreen());
              }
            },
          ),
        ],
      ),
    );
  }
}
