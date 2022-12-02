import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:http/http.dart' as http;
import 'package:timezone/data/latest_all.dart' as tz;
import 'package:timezone/timezone.dart' as tz;


class TimeNew_LocalNotification_Screen extends StatefulWidget {
  const TimeNew_LocalNotification_Screen({Key? key}) : super(key: key);

  @override
  State<TimeNew_LocalNotification_Screen> createState() =>
      _TimeNew_LocalNotification_ScreenState();
}

class _TimeNew_LocalNotification_ScreenState extends State<TimeNew_LocalNotification_Screen> {
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
              await local!.zonedSchedule(1,"All Time Best Movie in World Avatar","2009 Avatar Watch Now in Your Ott",
                  tz.TZDateTime.now(tz.local).add(Duration(seconds: 10)), nd,
                  uiLocalNotificationDateInterpretation: UILocalNotificationDateInterpretation.absoluteTime,
                  androidAllowWhileIdle: true,
              );
            },
            child: Text("TimeLocal Notifications"),
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

    tz.initializeTimeZones();
    await local!.initialize(flutterSettings);
  }

  Future<Uint8List> getImage(String uri)async{
    var imageString = await http.get(Uri.parse(uri));
    return  imageString.bodyBytes;
  }
}
