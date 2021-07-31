import 'package:get/get.dart';
import 'package:parenteach/routes/guru_binding.dart';
import 'package:parenteach/routes/nilai_harian_binding.dart';
import 'package:parenteach/routes/qna_binding.dart';
import 'package:parenteach/routes/reminding_binding.dart';
import 'package:parenteach/routes/siswa_binding.dart';
import 'package:parenteach/routes/webview_binding.dart';
import 'package:parenteach/views/admin/admin_add_qna.dart';
import 'package:parenteach/views/admin/admin_add_reminding.dart';
import 'package:parenteach/views/admin/admin_home_page.dart';
import 'package:parenteach/views/admin/admin_reminding_page.dart';
import 'package:parenteach/views/admin/admin_tambah_guru.dart';
import 'package:parenteach/views/admin/admin_tambah_nilai_rapot.dart';
import 'package:parenteach/views/admin/admin_tambah_siswa.dart';
import 'package:parenteach/views/admin/daftar_guru.dart';
import 'package:parenteach/views/admin/daftar_siswa.dart';
import 'package:parenteach/views/admin/tambah_nilai_harian.dart';
import 'package:parenteach/views/nilai_harian_page.dart';
import 'package:parenteach/views/profil_page.dart';
import 'package:parenteach/views/profil_siswa_page.dart';
import 'package:parenteach/views/web_view_page.dart';
import '../views/rapot_page.dart';

import '../views/reminding_page.dart';
import '../views/views.dart';
import 'login_binding.dart';
import 'route_name.dart';

class Routes {
  static final route = [
    GetPage(
      name: routeName.reverse[RouteName.LOGINPAGE]!,
      page: () => LoginPage(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: routeName.reverse[RouteName.HOMEPAGE]!,
      page: () => HomePage(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: routeName.reverse[RouteName.PLAYGROUNDPAGE]!,
      page: () => PlaygroundPage(),
    ),
    GetPage(
      name: routeName.reverse[RouteName.ACTIVITIESPAGE]!,
      page: () => ActivitiesPage(),
    ),
    GetPage(
      name: routeName.reverse[RouteName.BLOGPAGE]!,
      page: () => BlogPage(),
    ),
    GetPage(
      name: routeName.reverse[RouteName.REMINDINGPAGE]!,
      page: () => RemindingPage(),
      binding: RemindingBinding(),
    ),
    GetPage(
      name: routeName.reverse[RouteName.KALENDERPAGE]!,
      page: () => KalenderPage(),
    ),
    GetPage(
      name: routeName.reverse[RouteName.QNAPAGE]!,
      page: () => QnaPage(),
      binding: QnaBinding(),
    ),
    GetPage(
      name: routeName.reverse[RouteName.RAPOTPAGE]!,
      page: () => RapotPage(),
      bindings: [
        SiswaBinding(),
        NilaiHarianBinding(),
      ],
    ),
    GetPage(
      name: routeName.reverse[RouteName.ADMINHOMEPAGE]!,
      page: () => AdminHomePage(),
    ),
    GetPage(
      name: routeName.reverse[RouteName.ADMINREMINDINGPAGE]!,
      page: () => AdminRemindingPage(),
      binding: RemindingBinding(),
    ),
    GetPage(
      name: routeName.reverse[RouteName.ADMINTAMBAHREMINDINGPAGE]!,
      page: () => AdminAddReminding(),
      binding: RemindingBinding(),
    ),
    GetPage(
      name: routeName.reverse[RouteName.DAFTARGURUPAGE]!,
      page: () => DaftarGuruPage(),
      binding: GuruBinding(),
    ),
    GetPage(
      name: routeName.reverse[RouteName.DAFTARSISWAPAGE]!,
      page: () => DaftarSiswaPage(),
      binding: SiswaBinding(),
    ),
    GetPage(
      name: routeName.reverse[RouteName.ADMINADDQNAPAGE]!,
      page: () => AdminAddQna(),
    ),
    GetPage(
      name: routeName.reverse[RouteName.ADMINTAMBAHGURUPAGE]!,
      page: () => AdminTambahGuru(),
      binding: GuruBinding(),
    ),
    GetPage(
      name: routeName.reverse[RouteName.ADMINTAMBAHNILAIRAPOTPAGE]!,
      page: () => AdminTambahNilaiRapot(),
    ),
    GetPage(
      name: routeName.reverse[RouteName.TAMBAHNILAIHARIANPAGE]!,
      page: () => TambahNilaiHarian(),
      binding: NilaiHarianBinding(),
    ),
    GetPage(
      name: routeName.reverse[RouteName.NILAIHARIANPAGE]!,
      page: () => NilaiHarianPage(),
      binding: NilaiHarianBinding(),
    ),
    GetPage(
      name: routeName.reverse[RouteName.ADMINTAMBAHSISWAPAGE]!,
      page: () => AdminTambahSiswa(),
      binding: SiswaBinding(),
    ),
    GetPage(
      name: routeName.reverse[RouteName.PROFILSISWAPAGE]!,
      page: () => ProfilSiswaPage(),
      binding: SiswaBinding(),
    ),
    GetPage(
      name: routeName.reverse[RouteName.PROFILPAGE]!,
      page: () => ProfilPage(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: routeName.reverse[RouteName.WEBVIEW]!,
      page: () => WebviewPage(),
      binding: WebviewBinding(),
    ),
  ];
}
