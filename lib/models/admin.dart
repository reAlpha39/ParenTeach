// To parse this JSON data, do
//
//     final admin = adminFromMap(jsonString);

import 'dart:convert';

class Admin {
  Admin({
    this.nip,
    this.username,
    this.noHp,
    this.email,
    this.jenisKelamin,
    this.namaAdmin,
    this.foto,
    this.status,
    this.password,
  });

  String? nip;
  String? username;
  String? noHp;
  String? email;
  String? jenisKelamin;
  String? namaAdmin;
  String? foto;
  String? status;
  String? password;

  factory Admin.fromJson(String str) => Admin.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Admin.fromMap(Map<String, dynamic> json) => Admin(
        nip: json["nip"] == null ? null : json["nip"],
        username: json["username"] == null ? null : json["username"],
        noHp: json["noHp"] == null ? null : json["noHp"],
        email: json["email"] == null ? null : json["email"],
        jenisKelamin:
            json["jenisKelamin"] == null ? null : json["jenisKelamin"],
        namaAdmin: json["namaAdmin"] == null ? null : json["namaAdmin"],
        foto: json["foto"] == null ? null : json["foto"],
        status: json["status"] == null ? null : json["status"],
        password: json["password"] == null ? null : json["password"],
      );

  Map<String, dynamic> toMap() => {
        "nip": nip == null ? null : nip,
        "username": username == null ? null : username,
        "noHp": noHp == null ? null : noHp,
        "email": email == null ? null : email,
        "jenisKelamin": jenisKelamin == null ? null : jenisKelamin,
        "namaAdmin": namaAdmin == null ? null : namaAdmin,
        "foto": foto == null ? null : foto,
        "status": status == null ? null : status,
        "password": password == null ? null : password,
      };
}
