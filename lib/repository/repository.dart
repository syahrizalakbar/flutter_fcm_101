import 'dart:convert';

import 'package:flutter_webinar_firebase/model/res_add_task.dart';
import 'package:flutter_webinar_firebase/model/res_get_jabatan.dart';
import 'package:flutter_webinar_firebase/model/res_get_other_user.dart';
import 'package:flutter_webinar_firebase/model/res_get_task.dart';
import 'package:flutter_webinar_firebase/model/res_login.dart';
import 'package:dio/dio.dart';
import 'package:flutter_webinar_firebase/model/res_update_token.dart';

import '../model/res_logout.dart';

class Repository {
  var dio = Dio(BaseOptions(
    baseUrl: "http://192.168.43.30/fcm101/",
  ));

  Future<ResLogin> login(String username, String password) async {
    Response res = await dio.post(
      "login.php",
      data: FormData.fromMap({'username': username, 'password': password}),
    );

    print(res.data);
    return ResLogin.fromJson(res.data);
  }

  Future<ResLogout> logout(int id, String deviceId) async {
    Response res = await dio.post(
      "logout.php",
      data: FormData.fromMap({'id': id, 'device_id': deviceId}),
    );
    return ResLogout.fromJson(res.data);
  }

  Future<ResUpdateToken> updateToken(
      int idUser, String deviceId, String tokenFcm) async {
    Response res = await dio.post(
      "update_token.php",
      data: FormData.fromMap({
        'id_user': idUser,
        'device_id': deviceId,
        'token': tokenFcm,
      }),
    );

    return ResUpdateToken.fromJson(res.data);
  }


  Future<List<OtherUser>> getOtherUser(int id) async {
    Response res = await dio.post(
      "get_other_user.php",
      data: FormData.fromMap({
        'id': id,
      }),
    );

    return resGetOtherUserFromJson(jsonEncode(res.data));
  }


  Future<ResGetTask> getTask(int id) async {
    Response res = await dio.post(
      "get_task.php",
      data: FormData.fromMap({
        'id': id,
      }),
    );
    return ResGetTask.fromJson(res.data);
  }

  Future<List<String>> getJabatan() async {
    Response res = await dio.get(
      "get_jabatan.php",
    );

    return resGetJabatanFromJson(jsonEncode(res.data));
  }

  Future<ResAddTask> addTask(
      int createdBy, String title, String description,
      {List<int> toIds = const [], List<String> toJabatan = const []}) async {
    var data = {
      'created_by': createdBy,
      'title': title,
      'description': description,
    };

    int i = 0;
    toIds.forEach((id) {
      data['to_ids[$i]'] = id;
      i++;
    });

    i = 0;
    toJabatan.forEach((jabatan) {
      data['to_jabatans[$i]'] = jabatan;
      i++;
    });

    Response res = await dio.post(
      "add_task.php",
      data: FormData.fromMap(data),
    );

    return ResAddTask.fromJson(res.data);
  }
}
Repository repo = Repository();