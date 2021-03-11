import 'package:flutter/material.dart';
import 'package:flutter_webinar_firebase/model/res_get_task.dart';

import '../repository/repository.dart';

class MyTaskPage extends StatefulWidget {
  final String idUser;

  const MyTaskPage(this.idUser);

  @override
  _MyTaskPageState createState() => _MyTaskPageState();
}

class _MyTaskPageState extends State<MyTaskPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My Task"),
        centerTitle: true,
      ),
      body: FutureBuilder<ResGetTask>(
        future: repo.getTask(int.parse(widget.idUser)),
        builder: (BuildContext context, AsyncSnapshot<ResGetTask> snapshot) {
          if (snapshot.hasError)
            return Center(
              child: Text(snapshot.error.toString()),
            );
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data.data.length,
              itemBuilder: (context, index) {
                Task task = snapshot.data.data[index];

                return Card(
                  child: ListTile(
                    title: Text(task.title ?? "-"),
                    subtitle: Text(
                      "${task.description ?? "-"}\n${task.createdAt}",
                      style: TextStyle(color: Colors.grey),
                    ),
                    isThreeLine: true,
                  ),
                );
              },
            );
          }

          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
