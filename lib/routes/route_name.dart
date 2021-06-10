enum RouteName {
  LOGINPAGE,
  HOMEPAGE,
  PLAYGROUNDPAGE,
  ACTIVITIESPAGE,
  BLOGPAGE,
  REMINDINGPAGE,
}

final routeName = EnumValues({
  '/login_page': RouteName.LOGINPAGE,
  '/home_page': RouteName.HOMEPAGE,
  '/playground_page': RouteName.PLAYGROUNDPAGE,
  '/activities_page': RouteName.ACTIVITIESPAGE,
  '/blog_page': RouteName.BLOGPAGE,
  '/reminding_page': RouteName.REMINDINGPAGE,
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
