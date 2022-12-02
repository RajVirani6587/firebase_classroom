import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/firebase_screen.dart';


class Create_Account extends StatefulWidget {
  const Create_Account({Key? key}) : super(key: key);

  @override
  State<Create_Account> createState() => _Create_AccountState();
}

class _Create_AccountState extends State<Create_Account> {
  TextEditingController txtemail = TextEditingController();
  TextEditingController txtpassword = TextEditingController();
  var txtkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return  Form(
      key: txtkey,
      child: SafeArea(
         child: Scaffold(
           body: Container(
             height: double.infinity,
             width: double.infinity,
             child: Stack(
               children: [
                 Image.asset(
                   "assets/image/back.jpg",
                   fit: BoxFit.cover,
                   height: double.infinity,
                   width: double.infinity,
                   scale: 1,
                 ),
                 Center(
                   child: Column(
                     mainAxisAlignment: MainAxisAlignment.center,
                     children: [
                       Text(
                         "Create",
                         style: TextStyle(
                             color: Colors.white,
                             fontSize: 50,
                             fontWeight: FontWeight.bold),
                       ),
                       Text(
                         "account",
                         style: TextStyle(color: Colors.white54, fontSize: 20),
                       ),
                       SizedBox(
                         height: 15,
                       ),
                       Container(
                         margin:
                         EdgeInsets.only(left: 25, right: 25, top: 15, bottom: 15),
                         child: TextFormField(
                             validator: (value){
                               if(value!.isEmpty)
                               {
                                 return 'Enter Email';
                               }
                               else{
                                 return null;
                               }
                             },
                             style: TextStyle(color: Colors.white),
                             controller: txtemail,
                             decoration: InputDecoration(
                               border: OutlineInputBorder(),
                               label: Text("E-mail",style: TextStyle(color: Colors.white),),
                               suffixIcon: Icon(
                                 Icons.email_outlined,
                                 color: Colors.white,
                               ),
                             ),
                             ),
                       ),
                       Container(
                         margin:
                         EdgeInsets.only(left: 25, right: 25, top: 15, bottom: 15),
                         child: TextFormField(
                           validator: (value){
                             if(value!.isEmpty)
                             {
                               return 'Enter Password';
                             }
                             else{
                               return null;
                             }
                           },
                           style: TextStyle(color: Colors.white),
                           controller: txtpassword,
                           decoration: InputDecoration(
                             border: OutlineInputBorder(),
                             label: Text("Password",style: TextStyle(color: Colors.white),),
                             suffixIcon: Icon(
                               Icons.lock,
                               color: Colors.white,
                             ),
                           ),
                         ),
                       ),
                       InkWell(
                         onTap: () async {
                           String msg = await singup(txtemail.text, txtpassword.text);
                           Get.snackbar('${msg}', '');
                           if(txtkey.currentState!.validate() == true) {
                             if (msg == "Success") {
                               Get.offNamed('out');
                             }
                           }
                         },
                         child: Container(
                           decoration: BoxDecoration(
                             color: Colors.blue.shade600,
                             borderRadius: BorderRadius.circular(20),
                           ),
                           margin: EdgeInsets.all(25),
                           width: double.infinity,
                           height: 40,
                           child: Center(
                               child: Text(
                                 "Sign up",
                                 style: TextStyle(fontSize: 30, color: Colors.white),
                               )),
                         ),
                       ),
                       SizedBox(
                         height: 25,
                       ),
                     ],
                   ),
                 ),
               ],
             ),
           ),
         ),
       ),
    );
  }
}
