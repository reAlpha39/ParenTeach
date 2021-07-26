// To parse this JSON data, do
//
//     final blog = blogFromMap(jsonString);

import 'dart:convert';

class Blog {
  Blog({
    this.idBlog,
    this.judul,
    this.tanggal,
    this.isi,
  });

  String? idBlog;
  String? judul;
  String? tanggal;
  String? isi;

  factory Blog.fromJson(String str) => Blog.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Blog.fromMap(Map<String, dynamic> json) => Blog(
        idBlog: json["idBlog"] == null ? null : json["idBlog"],
        judul: json["judul"] == null ? null : json["judul"],
        tanggal: json["tanggal"] == null ? null : json["tanggal"],
        isi: json["isi"] == null ? null : json["isi"],
      );

  Map<String, dynamic> toMap() => {
        "idBlog": idBlog == null ? null : idBlog,
        "judul": judul == null ? null : judul,
        "tanggal": tanggal == null ? null : tanggal,
        "isi": isi == null ? null : isi,
      };
}
