// To parse this JSON data, do
//
//     final kelas = kelasFromMap(jsonString);

import 'dart:convert';

class Kelas {
  Kelas({
    this.idKelas,
    this.ruangan,
    this.tingkat,
  });

  String? idKelas;
  String? ruangan;
  String? tingkat;

  factory Kelas.fromJson(String str) => Kelas.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Kelas.fromMap(Map<String, dynamic> json) => Kelas(
        idKelas: json["idKelas"] == null ? null : json["idKelas"],
        ruangan: json["ruangan"] == null ? null : json["ruangan"],
        tingkat: json["tingkat"] == null ? null : json["tingkat"],
      );

  Map<String, dynamic> toMap() => {
        "idKelas": idKelas == null ? null : idKelas,
        "ruangan": ruangan == null ? null : ruangan,
        "tingkat": tingkat == null ? null : tingkat,
      };
}
