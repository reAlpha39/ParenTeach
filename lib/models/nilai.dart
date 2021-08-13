// To parse this JSON data, do
//
//     final nilai = nilaiFromMap(jsonString);

import 'dart:convert';

class Nilai {
  Nilai({
    this.nis,
    this.idMapel,
    this.nKeterampilan,
    this.nPengetahuan,
    this.tahunAjar,
    this.semester,
  });

  String? nis;
  String? idMapel;
  int? nKeterampilan;
  int? nPengetahuan;
  String? tahunAjar;
  String? semester;

  factory Nilai.fromJson(String str) => Nilai.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Nilai.fromMap(Map<String, dynamic> json) => Nilai(
        nis: json["nis"] == null ? null : json["nis"],
        idMapel: json["idMapel"] == null ? null : json["idMapel"],
        nKeterampilan:
            json["nKeterampilan"] == null ? null : json["nKeterampilan"],
        nPengetahuan:
            json["nPengetahuan"] == null ? null : json["nPengetahuan"],
        tahunAjar: json["tahunAjar"] == null ? null : json["tahunAjar"],
        semester: json["semester"] == null ? null : json["semester"],
      );

  Map<String, dynamic> toMap() => {
        "nis": nis == null ? null : nis,
        "idMapel": idMapel == null ? null : idMapel,
        "nKeterampilan": nKeterampilan == null ? null : nKeterampilan,
        "nPengetahuan": nPengetahuan == null ? null : nPengetahuan,
        "tahunAjar": tahunAjar == null ? null : tahunAjar,
        "semester": semester == null ? null : semester,
      };
}
