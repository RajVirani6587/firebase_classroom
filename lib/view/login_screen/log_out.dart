import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/firebase_screen.dart';
import 'home_controller.dart';


class LogOut_Screen extends StatefulWidget {
  const LogOut_Screen({Key? key}) : super(key: key);

  @override
  State<LogOut_Screen> createState() => _LogOut_ScreenState();
}

class _LogOut_ScreenState extends State<LogOut_Screen> {
  Homecontroller homecontroller = Get.put(Homecontroller());

  @override
  void initState() {
    super.initState();
    getProfile();
  }

  void getProfile() async {
    homecontroller.userdataList.value = await userProfile();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        drawer: Drawer(
          elevation: 10,
          child: Container(
            child: Obx(
              () => Column(
                children: [
                  SizedBox(height: 10,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Image.network("${homecontroller.userdataList[2]}"),
                      Column(
                        children: [
                          Text("${homecontroller.userdataList[1]}"),
                          SizedBox(height: 4,),
                          Text("${homecontroller.userdataList[0]}"),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            "Home Screen",
          ),
          actions: [
            IconButton(
                onPressed: () {
                  logout();
                  Get.offNamed('login');
                },
                icon: Icon(Icons.logout)),
          ],
        ),
        body: Center(
        ),
      ),
    );
  }
}
