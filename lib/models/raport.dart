// To parse this JSON data, do
//
//     final raport = raportFromMap(jsonString);

import 'dart:convert';

import 'package:parenteach/models/bakat_siswa.dart';

class Raport {
  Raport({
    this.idRaport,
    this.nis,
    this.tahunAjar,
    this.semester,
    this.presensiSiswa,
    this.sikapSiswa,
    this.mataPelajaran,
    this.nilaiKeterampilan,
    this.nilaiPengetahuan,
    this.rangking,
    this.rataRataNilai,
    this.downloadFile,
    this.bakatSiswa,
  });

  String? idRaport;
  String? nis;
  String? tahunAjar;
  String? semester;
  String? presensiSiswa;
  String? sikapSiswa;
  String? mataPelajaran;
  int? nilaiKeterampilan;
  int? nilaiPengetahuan;
  String? rangking;
  String? rataRataNilai;
  String? downloadFile;
  BakatSiswa? bakatSiswa;

  factory Raport.fromJson(String str) => Raport.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Raport.fromMap(Map<String, dynamic> json) => Raport(
        idRaport: json["idRaport"] == null ? null : json["idRaport"],
        nis: json["nis"] == null ? null : json["nis"],
        tahunAjar: json["tahunAjar"] == null ? null : json["tahunAjar"],
        semester: json["semester"] == null ? null : json["semester"],
        presensiSiswa:
            json["presensiSiswa"] == null ? null : json["presensiSiswa"],
        sikapSiswa: json["sikapSiswa"] == null ? null : json["sikapSiswa"],
        mataPelajaran:
            json["mataPelajaran"] == null ? null : json["mataPelajaran"],
        nilaiKeterampilan: json["nilaiKeterampilan"] == null
            ? null
            : json["nilaiKeterampilan"],
        nilaiPengetahuan:
            json["nilaiPengetahuan"] == null ? null : json["nilaiPengetahuan"],
        rangking: json["rangking"] == null ? null : json["rangking"],
        rataRataNilai:
            json["rataRataNilai"] == null ? null : json["rataRataNilai"],
        downloadFile:
            json["downloadFile"] == null ? null : json["downloadFile"],
        bakatSiswa: json["bakatSiswa"] == null
            ? null
            : bakatSiswaTypeValues.map![json["bakatSiswa"]],
      );

  Map<String, dynamic> toMap() => {
        "idRaport": idRaport == null ? null : idRaport,
        "nis": nis == null ? null : nis,
        "tahunAjar": tahunAjar == null ? null : tahunAjar,
        "semester": semester == null ? null : semester,
        "presensiSiswa": presensiSiswa == null ? null : presensiSiswa,
        "sikapSiswa": sikapSiswa == null ? null : sikapSiswa,
        "mataPelajaran": mataPelajaran == null ? null : mataPelajaran,
        "nilaiKeterampilan":
            nilaiKeterampilan == null ? null : nilaiKeterampilan,
        "nilaiPengetahuan": nilaiPengetahuan == null ? null : nilaiPengetahuan,
        "rangking": rangking == null ? null : rangking,
        "rataRataNilai": rataRataNilai == null ? null : rataRataNilai,
        "downloadFile": downloadFile == null ? null : downloadFile,
        "bakatSiswa": bakatSiswa == null
            ? null
            : bakatSiswaTypeValues.reverse[bakatSiswa],
      };
}
