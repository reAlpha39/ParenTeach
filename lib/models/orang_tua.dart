// To parse this JSON data, do
//
//     final orangTua = orangTuaFromMap(jsonString);

import 'dart:convert';

class OrangTua {
  OrangTua({
    this.idOrangTua,
    this.nama,
    this.namaSiswa,
    this.nis,
    this.email,
    this.noHp,
  });

  String? idOrangTua;
  String? nama;
  String? namaSiswa;
  String? nis;
  String? email;
  String? noHp;

  factory OrangTua.fromJson(String str) => OrangTua.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory OrangTua.fromMap(Map<String, dynamic> json) => OrangTua(
        idOrangTua: json["idOrangTua"] == null ? null : json["idOrangTua"],
        nama: json["nama"] == null ? null : json["nama"],
        namaSiswa: json["namaSiswa"] == null ? null : json["namaSiswa"],
        nis: json["nis"] == null ? null : json["nis"],
        email: json["email"] == null ? null : json["email"],
        noHp: json["noHp"] == null ? null : json["noHp"],
      );

  Map<String, dynamic> toMap() => {
        "idOrangTua": idOrangTua == null ? null : idOrangTua,
        "nama": nama == null ? null : nama,
        "namaSiswa": namaSiswa == null ? null : namaSiswa,
        "nis": nis == null ? null : nis,
        "email": email == null ? null : email,
        "noHp": noHp == null ? null : noHp,
      };
}
