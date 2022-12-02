import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/firebase_screen.dart';

class Login_Screen extends StatefulWidget {
  const Login_Screen({Key? key}) : super(key: key);

  @override
  State<Login_Screen> createState() => _Login_ScreenState();
}

class _Login_ScreenState extends State<Login_Screen> {
  TextEditingController txtemail2  = TextEditingController();
  TextEditingController txtpassword2  = TextEditingController();
   var txtkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
     return SafeArea(
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
                   child:Column(
                     mainAxisAlignment: MainAxisAlignment.center,
                     children: [
                       Text("FireRoom",style: TextStyle(color: Colors.white,fontSize: 40),),
                       SizedBox(height: 30,),
                       Container(
                         margin: EdgeInsets.only(left: 25,right: 25,top: 15,bottom: 15),
                         child: TextFormField(
                           style: TextStyle(color: Colors.white),
                           validator: (value){
                             if(value!.isEmpty)
                             {
                               return 'Enter Email';
                             }
                             else{
                               return null;
                             }
                           },
                           controller: txtemail2,
                           decoration: InputDecoration(
                             border:OutlineInputBorder(
                                 borderSide: BorderSide(color: Colors.blue)
                             ),
                             label: Text("E-mail",style: TextStyle(color: Colors.white),),
                             suffixIcon: Icon(Icons.email_outlined,color: Colors.white,),
                           ),
                         ),
                       ),
                       Container(
                         margin: EdgeInsets.only(left:25,right: 25,top: 15,bottom: 15),
                         child: TextFormField(
                           style: TextStyle(color: Colors.white),
                           validator: (value){
                             if(value!.isEmpty)
                             {
                               return 'Enter Password';
                             }
                             else{
                               return null;
                             }
                           },
                           controller: txtpassword2,
                           decoration: InputDecoration(
                             border:OutlineInputBorder(
                               borderSide: BorderSide(color: Colors.blue)
                             ),
                             label: Text("Password",style: TextStyle(color: Colors.white),),
                             suffixIcon: Icon(Icons.lock,color: Colors.white,),
                           ),
                         ),
                       ),
                       InkWell(onTap: ()async{
                         String msg = await loginEmailPassword(txtemail2.text,txtpassword2.text);
                         Get.snackbar('$msg','');
                         if(msg == "Success")
                         {
                           Get.offNamed('out');
                         }
                       },
                         child: Container(
                           decoration: BoxDecoration(
                               color: Colors.blue.shade600,
                               borderRadius: BorderRadius.circular(20)
                           ),
                           margin: EdgeInsets.all(25),
                           width: double.infinity,
                           height: 40,
                           child: Center(child: Text("Sign in",style: TextStyle(fontSize: 30,color: Colors.white),)),
                         ),
                       ),
                       SizedBox(height: 15,),

                       GestureDetector(onTap: ()async{
                         bool msg = await googlelogin();
                         //if(txtkey.currentState!.validate() == true)

                         if(msg)
                         {
                           Get.offNamed('out');
                         }
                       },child: Image.asset("assets/image/google.png",width: 40,height: 40,)),
                       SizedBox(height: 25,),
                       Row(
                         mainAxisAlignment: MainAxisAlignment.center,
                         children: [
                           Text("Don't have account?",style: TextStyle(color: Colors.white),),
                           InkWell(onTap: (){
                             Navigator.pushReplacementNamed(context,'create');
                           },
                             child: Text("Sign up",style: TextStyle(color: Colors.blue),),),
                         ],
                       ),
                     ],
                   ),
                 ),
               ],
             ),
           ),
         ),
     );
  }
}
