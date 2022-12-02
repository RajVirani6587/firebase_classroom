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

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Create",
                style: TextStyle(
                    color: Colors.blue.shade900,
                    fontSize: 50,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                "account",
                style: TextStyle(color: Colors.blue, fontSize: 20),
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                margin:
                    EdgeInsets.only(left: 25, right: 25, top: 15, bottom: 15),
                child: TextFormField(
                    controller: txtemail,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      label: Text("E-mail"),
                      suffixIcon: Icon(
                        Icons.email_outlined,
                        color: Colors.blue.shade900,
                      ),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Enter Email';
                      } else {
                        return null;
                      }
                    }),
              ),
              Container(
                margin:
                    EdgeInsets.only(left: 25, right: 25, top: 15, bottom: 15),
                child: TextFormField(
                  controller: txtpassword,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    label: Text("Password"),
                    suffixIcon: Icon(
                      Icons.lock,
                      color: Colors.blue.shade900,
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: () async {
                  String msg = await singup(txtemail.text, txtpassword.text);
                  Get.snackbar('${msg}', '');
                  if (msg == "Success") {
                    Get.offNamed('out');
                  }
                },
                child: Container(
                  color: Colors.blue.shade600,
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
      ),
    );
  }
}
