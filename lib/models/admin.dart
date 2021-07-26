// To parse this JSON data, do
//
//     final admin = adminFromMap(jsonString);

import 'dart:convert';

import 'package:parenteach/models/status.dart';
import 'package:parenteach/models/users.dart';

class Admin extends Users {
  Admin({
    this.nip,
    this.idUser,
    this.jenisKelamin,
    this.foto,
    this.status,
  });
  String? idUser;
  String? nip;
  String? jenisKelamin;
  String? foto;
  Status? status;

  factory Admin.fromJson(String str) => Admin.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Admin.fromMap(Map<String, dynamic> json) => Admin(
        nip: json["nip"] == null ? null : json["nip"],
        idUser: json["idUser"] == null ? null : json["idUser"],
        jenisKelamin:
            json["jenisKelamin"] == null ? null : json["jenisKelamin"],
        foto: json["foto"] == null ? null : json["foto"],
        status: json["status"] == null
            ? null
            : statusTypeValues.map![json["status"]],
      );

  Map<String, dynamic> toMap() => {
        "nip": nip == null ? null : nip,
        "idUser": idUser == null ? null : idUser,
        "jenisKelamin": jenisKelamin == null ? null : jenisKelamin,
        "foto": foto == null ? null : foto,
        "status": status == null ? null : statusTypeValues.reverse[status],
      };
}
