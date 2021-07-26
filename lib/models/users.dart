// To parse this JSON data, do
//
//     final users = usersFromMap(jsonString);

import 'dart:convert';

import 'package:parenteach/models/user_type.dart';

class Users {
  Users({
    this.idUsers,
    this.username,
    this.password,
    this.nama,
    this.noHp,
    this.email,
    this.type,
  });

  String? idUsers;
  String? username;
  String? password;
  String? nama;
  String? noHp;
  String? email;
  UserType? type;

  factory Users.fromJson(String str) => Users.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Users.fromMap(Map<String, dynamic> json) => Users(
        idUsers: json["idUsers"] == null ? null : json["idUsers"],
        username: json["usersname"] == null ? null : json["usersname"],
        password: json["password"] == null ? null : json["password"],
        nama: json["nama"] == null ? null : json["nama"],
        noHp: json["noHp"] == null ? null : json["noHp"],
        email: json["email"] == null ? null : json["email"],
        type: json["type"] == null ? null : userTypeValues.map![json["type"]],
      );

  Map<String, dynamic> toMap() => {
        "idUsers": idUsers == null ? null : idUsers,
        "usersname": username == null ? null : username,
        "password": password == null ? null : password,
        "nama": nama == null ? null : nama,
        "noHp": noHp == null ? null : noHp,
        "email": email == null ? null : email,
        "type": type == null ? null : userTypeValues.reverse[type],
      };
}
