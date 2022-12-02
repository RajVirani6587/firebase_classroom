import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:http/http.dart' as http;


class LocalNotification_Screen extends StatefulWidget {
  const LocalNotification_Screen({Key? key}) : super(key: key);

  @override
  State<LocalNotification_Screen> createState() =>
      _LocalNotification_ScreenState();
}

class _LocalNotification_ScreenState extends State<LocalNotification_Screen> {
  FlutterLocalNotificationsPlugin? local;
  @override
  void initState() {
    super.initState();
    initNotification();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: ElevatedButton(
            onPressed: ()async{
             var image = ByteArrayAndroidBitmap(await getImage("https://cdn.mos.cms.futurecdn.net/FvLi2evhiuCYNdZ7HALQu3-1200-80.jpeg"));
             BigPictureStyleInformation big = BigPictureStyleInformation(image);
              AndroidNotificationDetails and = AndroidNotificationDetails(
                  "1", "android",
                  priority: Priority.high,
                  importance: Importance.max,
                  sound: RawResourceAndroidNotificationSound('home_song'),
                  styleInformation: big,
              );

              NotificationDetails nd = NotificationDetails(android: and);
              await local!.show(1, "All Time Best Movie in World Avatar","2009 Avatar Watch Now in Your Ott", nd);
            },
            child: Text("Local Notifications"),
          ),
        ),
      ),
    );
  }
  void initNotification()async{
    local = FlutterLocalNotificationsPlugin();

    AndroidInitializationSettings androidSettings = AndroidInitializationSettings("notification");
    DarwinInitializationSettings iosSettings = DarwinInitializationSettings();

    InitializationSettings flutterSettings = InitializationSettings(android: androidSettings,iOS: iosSettings);

     await local!.initialize(flutterSettings);
  }

  Future<Uint8List> getImage(String uri)async{
   var imageString = await http.get(Uri.parse(uri));
    return  imageString.bodyBytes;
  }
}
