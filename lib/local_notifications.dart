import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class LocalNotifications extends StatefulWidget {
  @override
  _LocalNotificationsState createState() => _LocalNotificationsState();
}

class _LocalNotificationsState extends State<LocalNotifications> {
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;

  @override
  void initState() {
    super.initState();
    flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
    var android = AndroidInitializationSettings('@mipmap/ic_launcher');
    var ios = IOSInitializationSettings();
    var initSetting = InitializationSettings(android, ios);
      flutterLocalNotificationsPlugin.initialize(initSetting,onSelectNotification: selectNotification);
  }

   Future selectNotification (String payload) async {
    debugPrint('$payload');
    showDialog(context: context, builder: (_) => AlertDialog(
              title: Text("Notification"),
              content: Text("$payload"),
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Local Notifications"),
      ),
      body: Container(
        alignment: Alignment.center,
        child:
            RaisedButton(child: Text("Click Me"), onPressed: showNotification),
      ),
    );
  }

  showNotification() async {
    var android = AndroidNotificationDetails('id', 'name', 'description');
    var ios = IOSNotificationDetails();
    var platform = NotificationDetails(android, ios);
    await flutterLocalNotificationsPlugin.show(0, "Notifications", "Hi obaida i  love you ", platform,
        payload: 'this is to hard');
  }
}
