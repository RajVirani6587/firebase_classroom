
import 'package:firebase_classroom/splace_screen.dart';
import 'package:firebase_classroom/view/login_screen/caret_accound.dart';
import 'package:firebase_classroom/view/login_screen/log_out.dart';
import 'package:firebase_classroom/view/login_screen/login.dart';
import 'package:firebase_classroom/view/notification/new_localnotification_screen.dart';
import 'package:firebase_classroom/view/notification/timenew_localnotification.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


void main()async{

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        //'/':(context)=>LocalNotification_Screen(),
        //
        // '/':(context)=>TimeNew_LocalNotification_Screen(),
        '/':(context)=> splesh_Screen(),
        'login':(context)=>Login_Screen(),
        'create':(context)=> Create_Account(),
        'out':(context)=>LogOut_Screen(),
      },
    ),
  );
}