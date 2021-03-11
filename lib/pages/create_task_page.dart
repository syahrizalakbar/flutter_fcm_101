import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_webinar_firebase/model/res_add_task.dart';
import 'package:flutter_webinar_firebase/model/res_get_other_user.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';

import '../repository/repository.dart';

class CreateTaskPage extends StatefulWidget {
  final String idUser;

  const CreateTaskPage(this.idUser);

  @override
  _CreateTaskPageState createState() => _CreateTaskPageState();
}

class _CreateTaskPageState extends State<CreateTaskPage> {
  TextEditingController title = TextEditingController();
  TextEditingController description = TextEditingController();

  List<int> selectedIdUser = [];
  List<String> selectedJabatan = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Create Task For"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(24),
          child: Column(
            children: <Widget>[
              TextFormField(
                controller: title,
                decoration: InputDecoration(
                  hintText: "Judul",
                  labelText: "Judul",
                  border: OutlineInputBorder(
                    borderSide: BorderSide(),
                  ),
                ),
              ),
              SizedBox(height: 16),
              TextFormField(
                controller: description,
                minLines: 3,
                maxLines: 5,
                textAlignVertical: TextAlignVertical.top,
                decoration: InputDecoration(
                  hintText: "Deskripsi",
                  labelText: "Deskripsi",
                  border: OutlineInputBorder(
                    borderSide: BorderSide(),
                  ),
                ),
              ),
              SizedBox(height: 16),
              FutureBuilder<List<OtherUser>>(
                future: repo.getOtherUser(int.parse(widget.idUser)),
                builder: (context, snapshot) {
                  if (snapshot.hasError)
                    return Center(
                      child: Text(snapshot.error.toString()),
                    );
                  if (snapshot.hasData) {
                    return MultiSelectDialogField<int>(
                      title: Text("Untuk user"),
                      buttonText: Text("Untuk user"),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(2),
                      ),
                      items: snapshot.data
                          .map((e) => MultiSelectItem(e.id, e.username))
                          .toList(),
                      listType: MultiSelectListType.LIST,
                      onConfirm: (values) {
                        selectedIdUser = values;
                      },
                    );
                  }

                  return Center(
                    child: CircularProgressIndicator(),
                  );
                },
              ),
              SizedBox(height: 16),
              FutureBuilder<List<String>>(
                future: repo.getJabatan(),
                builder: (context, snapshot) {
                  if (snapshot.hasError)
                    return Center(
                      child: Text(snapshot.error.toString()),
                    );
                  if (snapshot.hasData) {
                    return MultiSelectDialogField<String>(
                      title: Text("Untuk Jabatan"),
                      buttonText: Text("Untuk Jabatan"),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(2),
                      ),
                      items: snapshot.data
                          .map((e) => MultiSelectItem(e, e))
                          .toList(),
                      listType: MultiSelectListType.LIST,
                      onConfirm: (values) {
                        selectedJabatan = values;
                      },
                    );
                  }

                  return Center(
                    child: CircularProgressIndicator(),
                  );
                },
              ),
              SizedBox(height: 32),
              MaterialButton(
                child: Text("Add"),
                color: Colors.blue,
                textColor: Colors.white,
                onPressed: () async {
                  ResAddTask resAddTask = await repo.addTask(int.parse(widget.idUser), title.text, description.text, toIds: selectedIdUser, toJabatan: selectedJabatan,);
                  if (resAddTask.isSuccess) {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text(resAddTask.message),
                    ));
                    Navigator.pop(context);
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text(resAddTask.message),
                    ));
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
