 import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controller/firebase_screen.dart';

class splesh_Screen extends StatefulWidget {
  const splesh_Screen({Key? key}) : super(key: key);

  @override
  State<splesh_Screen> createState() => _splesh_ScreenState();
}

class _splesh_ScreenState extends State<splesh_Screen> {
  bool msg = false;

  @override
  void initState() {
    super.initState();
    msg = checkUser();
  }
  @override
  Widget build(BuildContext context) {
    isLogin();
    return SafeArea(
        child: Scaffold(
          body:Center(
            child: FlutterLogo(
              size: 150,
            ),
          ),
        ));
  }
  void isLogin(){
      Timer(
        Duration(seconds: 3),
            ()=>msg?Get.offAllNamed('out'):Get.offAllNamed('login'),
      );
  }

}