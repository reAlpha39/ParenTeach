// To parse this JSON data, do
//
//     final guru = guruFromMap(jsonString);

import 'dart:convert';

import 'package:parenteach/models/status.dart';
import 'package:parenteach/models/users.dart';

class Civitas extends Users {
  Civitas({
    this.nip,
    this.nama,
    this.idUser,
    this.jenisKelamin,
    this.foto,
    this.status,
  });

  String? nip;
  String? nama;
  String? idUser;
  String? jenisKelamin;
  String? foto;
  Status? status;

  factory Civitas.fromJson(String str) => Civitas.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Civitas.fromMap(Map<String, dynamic> json) => Civitas(
        nip: json["nip"] == null ? null : json["nip"],
        nama: json["nama"] == null ? null : json["nama"],
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
        "nama": nama == null ? null : nama,
        "idUser": idUser == null ? null : idUser,
        "jenisKelamin": jenisKelamin == null ? null : jenisKelamin,
        "foto": foto == null ? null : foto,
        "status": status == null ? null : statusTypeValues.reverse[status],
      };
}

List<Civitas> dummyCivitas = [
  Civitas(nama: 'Adi', status: Status.ADMIN),
  Civitas(nama: 'Adi', status: Status.GURUKELAS),
  Civitas(nama: 'Adi', status: Status.BK),
  Civitas(nama: 'Adi', status: Status.TU),
  Civitas(nama: 'Adi', status: Status.ADMIN),
  Civitas(nama: 'Adi', status: Status.ADMIN),
];
