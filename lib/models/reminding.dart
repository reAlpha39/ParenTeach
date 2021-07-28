// To parse this JSON data, do
//
//     final Reminding = RemindingFromMap(jsonString);

import 'dart:convert';

class Reminding {
  Reminding({
    this.idReminding,
    this.pertanyaan,
    this.isComplete,
  });

  String? idReminding;
  String? pertanyaan;
  bool? isComplete = false;

  factory Reminding.fromJson(String str) => Reminding.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Reminding.fromMap(Map<String, dynamic> json) => Reminding(
        idReminding: json["idReminding"] == null ? null : json["idReminding"],
        pertanyaan: json["pertanyaan"] == null ? null : json["pertanyaan"],
        isComplete: json["isComplete"] == null ? null : json["isComplete"],
      );

  Map<String, dynamic> toMap() => {
        "idReminding": idReminding == null ? null : idReminding,
        "pertanyaan": pertanyaan == null ? null : pertanyaan,
        "isComplete": isComplete == null ? null : isComplete,
      };
}
