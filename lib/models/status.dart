import 'package:parenteach/utils/utils.dart';

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
