enum RouteName {
  LOGINPAGE,
  HOMEPAGE,
  ADMINHOMEPAGE,
  PLAYGROUNDPAGE,
  ACTIVITIESPAGE,
  BLOGPAGE,
  REMINDINGPAGE,
  KALENDERPAGE,
  ADMINREMINDINGPAGE,
  ADMINTAMBAHREMINDINGPAGE,
  QNAPAGE,
  RAPOTPAGE,
  DAFTARGURUPAGE,
  DAFTARSISWAPAGE,
  ADMINQNAPAGE,
  ADMINADDQNAPAGE,
  ADMINTAMBAHGURUPAGE,
  ADMINTAMBAHNILAIRAPOTPAGE,
  ADMINTAMBAHSISWAPAGE,
  NILAIHARIANPAGE,
  TAMBAHNILAIHARIANPAGE,
  PROFILSISWAPAGE,
  PROFILPAGE,
  WEBVIEW,
  DAFTARKELAS,
  PROFILGURUPAGE,
  ADMINTAMBAHKELAS,
  CHATPAGE,
  MAINPAGE,
  ADDAGENDA,
  KALENDERPAGEORANGTUA,
}

final routeName = EnumValues({
  '/login_page': RouteName.LOGINPAGE,
  '/home_page': RouteName.HOMEPAGE,
  '/admin_home_page': RouteName.ADMINHOMEPAGE,
  '/playground_page': RouteName.PLAYGROUNDPAGE,
  '/activities_page': RouteName.ACTIVITIESPAGE,
  '/blog_page': RouteName.BLOGPAGE,
  '/reminding_page': RouteName.REMINDINGPAGE,
  '/kalender_page': RouteName.KALENDERPAGE,
  '/admin_reminding_page': RouteName.ADMINREMINDINGPAGE,
  '/admin_tambah_reminding_page': RouteName.ADMINTAMBAHREMINDINGPAGE,
  '/qna_page': RouteName.QNAPAGE,
  '/rapot_page': RouteName.RAPOTPAGE,
  '/daftar_guru_page': RouteName.DAFTARGURUPAGE,
  '/daftar_siswa_page': RouteName.DAFTARSISWAPAGE,
  '/admin_qna_page': RouteName.ADMINQNAPAGE,
  '/admin_add_qna_page': RouteName.ADMINADDQNAPAGE,
  '/admin_tambah_guru_page': RouteName.ADMINTAMBAHGURUPAGE,
  '/admin_nilai_rapot_page': RouteName.ADMINTAMBAHNILAIRAPOTPAGE,
  '/admin_tambah_siswa_page': RouteName.ADMINTAMBAHSISWAPAGE,
  '/nilai_harian_page': RouteName.NILAIHARIANPAGE,
  '/tambah_nilai_harian_page': RouteName.TAMBAHNILAIHARIANPAGE,
  '/profil_siswa_page': RouteName.PROFILSISWAPAGE,
  '/profil_page': RouteName.PROFILPAGE,
  '/webview': RouteName.WEBVIEW,
  '/daftar_kelas': RouteName.DAFTARKELAS,
  '/profil_guru_page': RouteName.PROFILGURUPAGE,
  '/admin_tambah_kelas': RouteName.ADMINTAMBAHKELAS,
  '/chat_page': RouteName.CHATPAGE,
  '/main_page': RouteName.MAINPAGE,
  '/add_agenda': RouteName.ADDAGENDA,
  '/kalender_page_orang_tua': RouteName.KALENDERPAGEORANGTUA,
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
