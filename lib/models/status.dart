enum Status {
  ADMIN,
  TU,
  GURUKELAS,
  BK,
}

final statusTypeValues = EnumValues({
  "admin": Status.ADMIN,
  "tu": Status.TU,
  "guruKelas": Status.GURUKELAS,
  "bk": Status.BK,
});

class EnumValues<T> {
  Map<String, T>? map;
  Map<T, String>? reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map!.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap!;
  }
}
