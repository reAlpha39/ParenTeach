// To parse this JSON data, do
//
//     final kelas = kelasFromMap(jsonString);

import 'dart:convert';

class Kelas {
  Kelas({
    this.idKelas,
    this.nama,
    this.tingkat,
  });

  String? idKelas;
  String? nama;
  String? tingkat;

  factory Kelas.fromJson(String str) => Kelas.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Kelas.fromMap(Map<String, dynamic> json) => Kelas(
        idKelas: json["idKelas"] == null ? null : json["idKelas"],
        nama: json["nama"] == null ? null : json["nama"],
        tingkat: json["tingkat"] == null ? null : json["tingkat"],
      );

  Map<String, dynamic> toMap() => {
        "idKelas": idKelas == null ? null : idKelas,
        "nama": nama == null ? null : nama,
        "tingkat": tingkat == null ? null : tingkat,
      };
}
