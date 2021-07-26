// To parse this JSON data, do
//
//     final qna = qnaFromMap(jsonString);

import 'dart:convert';

class Qna {
  Qna({
    this.idQna,
    this.pertanyaan,
    this.jawaban,
  });

  String? idQna;
  String? pertanyaan;
  String? jawaban;

  factory Qna.fromJson(String str) => Qna.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Qna.fromMap(Map<String, dynamic> json) => Qna(
        idQna: json["idQna"] == null ? null : json["idQna"],
        pertanyaan: json["pertanyaan"] == null ? null : json["pertanyaan"],
        jawaban: json["jawaban"] == null ? null : json["jawaban"],
      );

  Map<String, dynamic> toMap() => {
        "idQna": idQna == null ? null : idQna,
        "pertanyaan": pertanyaan == null ? null : pertanyaan,
        "jawaban": jawaban == null ? null : jawaban,
      };
}
