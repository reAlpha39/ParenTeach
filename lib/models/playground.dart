// To parse this JSON data, do
//
//     final playground = playgroundFromMap(jsonString);

import 'dart:convert';

class Playground {
  Playground({
    this.idPlayground,
    this.judul,
    this.tanggal,
    this.isi,
  });

  String? idPlayground;
  String? judul;
  String? tanggal;
  String? isi;

  factory Playground.fromJson(String str) =>
      Playground.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Playground.fromMap(Map<String, dynamic> json) => Playground(
        idPlayground:
            json["idPlayground"] == null ? null : json["idPlayground"],
        judul: json["judul"] == null ? null : json["judul"],
        tanggal: json["tanggal"] == null ? null : json["tanggal"],
        isi: json["isi"] == null ? null : json["isi"],
      );

  Map<String, dynamic> toMap() => {
        "idPlayground": idPlayground == null ? null : idPlayground,
        "judul": judul == null ? null : judul,
        "tanggal": tanggal == null ? null : tanggal,
        "isi": isi == null ? null : isi,
      };
}
