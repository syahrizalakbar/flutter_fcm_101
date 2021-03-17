import 'dart:io';

import 'package:device_info/device_info.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_webinar_firebase/pages/create_task_page.dart';
import 'package:flutter_webinar_firebase/pages/login_page.dart';
import 'package:flutter_webinar_firebase/model/res_login.dart';
import 'package:flutter_webinar_firebase/pages/my_task.dart';
import 'package:flutter_webinar_firebase/utils/sharedpref.dart';

import '../repository/repository.dart';

class Dashboard extends StatefulWidget {
  final User user;

  Dashboard(this.user);

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  FirebaseMessaging fcm = FirebaseMessaging();
  bool loading = false;

  Future<String> getDeviceId() async {
    var deviceInfo = DeviceInfoPlugin();
    if (Platform.isIOS) {
      var iosDeviceInfo = await deviceInfo.iosInfo;
      return iosDeviceInfo.identifierForVendor;
    } else {
      var androidDeviceInfo = await deviceInfo.androidInfo;
      return androidDeviceInfo.androidId;
    }
  }

  Future<void> logout() async {
    setState(() {
      loading = true;
    });
    await fcm.deleteInstanceID();
    await fcm.unsubscribeFromTopic(widget.user.jabatan);
    String deviceId = await getDeviceId();
    await repo.logout(int.parse(widget.user.id), deviceId);
    await clearPrefs();
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (c) => LoginPage()));
  }

  Future<void> updateTokenFcm() async {
    String token = await fcm.getToken();
    String deviceId = await getDeviceId();
    print("Token: $token");
    print("Device Id: $deviceId");
    await repo.updateToken(int.parse(widget.user.id), deviceId, token);
  }

  Future<void> configureSubscription() async {
    fcm.subscribeToTopic(widget.user.jabatan);
    fcm.requestNotificationPermissions();
    fcm.configure(
      onMessage: (Map<String, dynamic> message) async {
        print("onMessage: $message");
        showDialog(
            context: context, builder: (context) => notifDialog(message));
      },
      onLaunch: (Map<String, dynamic> message) async {
        print("onLaunch: $message");
        showDialog(
            context: context, builder: (context) => notifDialog(message));
      },
      onResume: (Map<String, dynamic> message) async {
        print("onResume: $message");
        showDialog(
            context: context, builder: (context) => notifDialog(message));
      },
    );
  }

  @override
  void initState() {
    updateTokenFcm();
    configureSubscription();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dashboard ${widget.user.username}"),
        centerTitle: true,
        actions: [
          loading
              ? Center(
                  child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                  ),
                )
              : IconButton(
                  icon: Icon(Icons.exit_to_app_rounded),
                  onPressed: logout,
                ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Container(
              width: 200,
              height: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black38,
                    blurRadius: 8,
                  ),
                ],
              ),
              child: InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (c) => MyTaskPage(widget.user.id)));
                },
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(
                      Icons.format_list_bulleted,
                      size: 48,
                    ),
                    Text(
                      "My Task",
                      style: TextStyle(fontSize: 24),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 24),
            Container(
              width: 200,
              height: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black38,
                    blurRadius: 8,
                  ),
                ],
              ),
              child: InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (c) => CreateTaskPage(widget.user.id)));
                },
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(
                      Icons.note_add,
                      size: 48,
                    ),
                    Text(
                      "Create Task for",
                      style: TextStyle(fontSize: 24),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  AlertDialog notifDialog(Map<String, dynamic> message) => AlertDialog(
        scrollable: true,
        title: Text("Tugas Baru"),
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(message['data']['title']),
            Text(message['data']['description']),
          ],
        ),
        actions: [
          MaterialButton(
            child: Text("Lihat"),
            color: Colors.blue,
            textColor: Colors.white,
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (c) => MyTaskPage(widget.user.id),
                ),
              );
            },
          ),
        ],
      );
}
