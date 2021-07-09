// To parse this JSON data, do
//
//     final siswa = siswaFromMap(jsonString);

import 'dart:convert';

class Siswa {
  Siswa({
    this.jenisKelamin,
    this.nis,
    this.fotoSiswa,
    this.idKelas,
    this.kelas,
    this.namaKelas,
  });

  String? jenisKelamin;
  String? nis;
  String? fotoSiswa;
  String? idKelas;
  String? kelas;
  String? namaKelas;

  factory Siswa.fromJson(String str) => Siswa.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Siswa.fromMap(Map<String, dynamic> json) => Siswa(
        jenisKelamin:
            json["jenisKelamin"] == null ? null : json["jenisKelamin"],
        nis: json["nis"] == null ? null : json["nis"],
        fotoSiswa: json["fotoSiswa"] == null ? null : json["fotoSiswa"],
        idKelas: json["idKelas"] == null ? null : json["idKelas"],
        kelas: json["kelas"] == null ? null : json["kelas"],
        namaKelas: json["namaKelas"] == null ? null : json["namaKelas"],
      );

  Map<String, dynamic> toMap() => {
        "jenisKelamin": jenisKelamin == null ? null : jenisKelamin,
        "nis": nis == null ? null : nis,
        "fotoSiswa": fotoSiswa == null ? null : fotoSiswa,
        "idKelas": idKelas == null ? null : idKelas,
        "kelas": kelas == null ? null : kelas,
        "namaKelas": namaKelas == null ? null : namaKelas,
      };
}
