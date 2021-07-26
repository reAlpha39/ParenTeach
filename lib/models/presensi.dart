// To parse this JSON data, do
//
//     final presensi = presensiFromMap(jsonString);

import 'dart:convert';

import 'package:parenteach/models/keterangan.dart';

class Presensi {
  Presensi({
    this.nis,
    this.keterangan,
    this.namaSiswa,
    this.tanggal,
  });

  String? nis;
  Keterangan? keterangan;
  String? namaSiswa;
  String? tanggal;

  factory Presensi.fromJson(String str) => Presensi.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Presensi.fromMap(Map<String, dynamic> json) => Presensi(
        nis: json["nis"] == null ? null : json["nis"],
        keterangan: json["keterangan"] == null
            ? null
            : keteranganTypeValues.map![json["keterangan"]],
        namaSiswa: json["namaSiswa"] == null ? null : json["namaSiswa"],
        tanggal: json["tanggal"] == null ? null : json["tanggal"],
      );

  Map<String, dynamic> toMap() => {
        "nis": nis == null ? null : nis,
        "keterangan": keterangan == null
            ? null
            : keteranganTypeValues.reverse[keterangan],
        "namaSiswa": namaSiswa == null ? null : namaSiswa,
        "tanggal": tanggal == null ? null : tanggal,
      };
}
