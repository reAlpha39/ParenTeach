enum RouteName {
  LOGINPAGE,
  HOMEPAGE,
  ADMINHOMEPAGE,
  PLAYGROUNDPAGE,
  ACTIVITIESPAGE,
  BLOGPAGE,
  REMINDINGPAGE,
  ADMINREMINDINGPAGE,
  QNAPAGE,
  RAPOTPAGE
}

final routeName = EnumValues({
  '/login_page': RouteName.LOGINPAGE,
  '/home_page': RouteName.HOMEPAGE,
  '/admin_home_page': RouteName.ADMINHOMEPAGE,
  '/playground_page': RouteName.PLAYGROUNDPAGE,
  '/activities_page': RouteName.ACTIVITIESPAGE,
  '/blog_page': RouteName.BLOGPAGE,
  '/reminding_page': RouteName.REMINDINGPAGE,
  '/admin_reminding_page': RouteName.ADMINREMINDINGPAGE,
  '/qna_page': RouteName.QNAPAGE,
  '/rapot_page': RouteName.RAPOTPAGE,
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
