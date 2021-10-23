// To parse this JSON data, do
//
//     final Agenda = AgendaFromMap(jsonString);

import 'dart:convert';

class Agenda {
  String? idAgenda;
  String? agenda;
  String? tanggalAgenda;

  factory Agenda.fromJson(String str) => Agenda.fromMap(json.decode(str));

  Agenda({this.idAgenda, this.agenda, this.tanggalAgenda});

  String toJson() => json.encode(toMap());

  factory Agenda.fromMap(Map<String, dynamic> json) => Agenda(
        idAgenda: json["idAgenda"] == null ? null : json["idAgenda"],
        agenda: json["agenda"] == null ? null : json["agenda"],
        tanggalAgenda:
            json["tanggalAgenda"] == null ? null : json["tanggalAgenda"],
      );

  Map<String, dynamic> toMap() => {
        "idAgenda": idAgenda == null ? null : idAgenda,
        "agenda": agenda == null ? null : agenda,
        "tanggalAgenda": tanggalAgenda == null ? null : tanggalAgenda,
      };
}
