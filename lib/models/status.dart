import '../utils/utils.dart';

enum Status {
  ADMIN,
  TU,
  GURUKELAS,
  BK,
}

final statusTypeValues = EnumValues({
  "Admin": Status.ADMIN,
  "Tata Usaha": Status.TU,
  "Guru Kelas": Status.GURUKELAS,
  "Guru Bimbingan Konseling": Status.BK,
});
