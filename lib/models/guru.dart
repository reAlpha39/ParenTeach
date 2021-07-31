// To parse this JSON data, do
//
//     final guru = guruFromMap(jsonString);

import 'dart:convert';

import 'package:parenteach/models/status.dart';
import 'package:parenteach/models/users.dart';

class Guru extends Users {
  Guru({
    this.nip,
    this.idUser,
    this.jenisKelamin,
    this.foto,
    this.status,
    this.waliKelas,
  });

  String? nip;
  String? idUser;
  String? jenisKelamin;
  String? foto;
  Status? status;
  String? waliKelas;

  factory Guru.fromJson(String str) => Guru.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Guru.fromMap(Map<String, dynamic> json) => Guru(
        nip: json["nip"] == null ? null : json["nip"],
        idUser: json["idUser"] == null ? null : json["idUser"],
        jenisKelamin:
            json["jenisKelamin"] == null ? null : json["jenisKelamin"],
        foto: json["foto"] == null ? null : json["foto"],
        status: json["status"] == null
            ? null
            : statusTypeValues.map![json["status"]],
        waliKelas: json["waliKelas"] == null ? null : json["waliKelas"],
      );

  Map<String, dynamic> toMap() => {
        "nip": nip == null ? null : nip,
        "idUser": idUser == null ? null : idUser,
        "jenisKelamin": jenisKelamin == null ? null : jenisKelamin,
        "foto": foto == null ? null : foto,
        "status": status == null ? null : statusTypeValues.reverse[status],
        "waliKelas": waliKelas == null ? null : waliKelas,
      };
}
