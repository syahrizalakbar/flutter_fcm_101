import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_webinar_firebase/utils/sharedpref.dart';
import 'dashboard.dart';

import 'login_page.dart';
import '../model/res_login.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(
      Duration(seconds: 2),
      () async {
        User user = await getUser();
        if (user != null) {
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (c) => Dashboard(user)));
        } else {
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (c) => LoginPage()));
        }
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.view_comfortable,
              size: 100,
              color: Colors.blue,
            ),
            SizedBox(height: 8),
            Text(
              "T A S K E R",
              style: TextStyle(
                fontSize: 24,
                color: Colors.blue,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
