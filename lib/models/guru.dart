// To parse this JSON data, do
//
//     final guru = guruFromMap(jsonString);

import 'dart:convert';

import 'package:parenteach/models/status.dart';

class Guru {
  Guru({
    this.nip,
    this.jelasKelamin,
    this.namaGuru,
    this.foto,
    this.status,
    this.username,
    this.password,
    this.noHp,
    this.email,
  });

  String? nip;
  String? jelasKelamin;
  String? namaGuru;
  String? foto;
  Status? status;
  String? username;
  String? password;
  String? noHp;
  String? email;

  factory Guru.fromJson(String str) => Guru.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Guru.fromMap(Map<String, dynamic> json) => Guru(
        nip: json["nip"] == null ? null : json["nip"],
        jelasKelamin:
            json["jelasKelamin"] == null ? null : json["jelasKelamin"],
        namaGuru: json["namaGuru"] == null ? null : json["namaGuru"],
        foto: json["foto"] == null ? null : json["foto"],
        status: json["status"] == null
            ? null
            : statusTypeValues.map![json["status"]],
        username: json["username"] == null ? null : json["username"],
        password: json["password"] == null ? null : json["password"],
        noHp: json["noHp"] == null ? null : json["noHp"],
        email: json["email"] == null ? null : json["email"],
      );

  Map<String, dynamic> toMap() => {
        "nip": nip == null ? null : nip,
        "jelasKelamin": jelasKelamin == null ? null : jelasKelamin,
        "namaGuru": namaGuru == null ? null : namaGuru,
        "foto": foto == null ? null : foto,
        "status": status == null ? null : statusTypeValues.reverse[status],
        "username": username == null ? null : username,
        "password": password == null ? null : password,
        "noHp": noHp == null ? null : noHp,
        "email": email == null ? null : email,
      };
}
