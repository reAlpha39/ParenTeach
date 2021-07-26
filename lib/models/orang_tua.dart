// To parse this JSON data, do
//
//     final orangTua = orangTuaFromMap(jsonString);

import 'dart:convert';

import 'package:parenteach/models/users.dart';

class OrangTua extends Users {
  OrangTua({
    this.idUser,
    this.namaSiswa,
    this.nis,
  });

  String? idUser;
  String? namaSiswa;
  String? nis;

  factory OrangTua.fromJson(String str) => OrangTua.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory OrangTua.fromMap(Map<String, dynamic> json) => OrangTua(
        idUser: json["idUser"] == null ? null : json["idUser"],
        namaSiswa: json["namaSiswa"] == null ? null : json["namaSiswa"],
        nis: json["nis"] == null ? null : json["nis"],
      );

  Map<String, dynamic> toMap() => {
        "idUser": idUser == null ? null : idUser,
        "namaSiswa": namaSiswa == null ? null : namaSiswa,
        "nis": nis == null ? null : nis,
      };
}
