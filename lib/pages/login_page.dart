import 'package:flutter/material.dart';
import 'dashboard.dart';
import 'package:flutter_webinar_firebase/utils/sharedpref.dart';

import '../model/res_login.dart';
import '../repository/repository.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
        centerTitle: true,
      ),
      body: Center(
        child: Card(
          child: Container(
            padding: EdgeInsets.all(48),
            child: Column(
              children: [
                TextFormField(
                  controller: username,
                  decoration: InputDecoration(
                    hintText: "Username",
                    labelText: "Username",
                    border: OutlineInputBorder(
                      borderSide: BorderSide(),
                    ),
                  ),
                ),
                SizedBox(height: 16),
                TextFormField(
                  controller: password,
                  decoration: InputDecoration(
                    hintText: "Password",
                    labelText: "Password",
                    border: OutlineInputBorder(
                      borderSide: BorderSide(),
                    ),
                  ),
                ),
                SizedBox(height: 32),
                MaterialButton(
                  child: Text("Login"),
                  color: Colors.blue,
                  textColor: Colors.white,
                  onPressed: () async {
                    ResLogin login =
                        await repo.login(username.text, password.text);
                    if (login.isSuccess) {
                      await persistUser(login.data);
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (c) => Dashboard(login.data)));
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text(login.message),
                      ));
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
