String tahunAjarSekarang() {
  String tahunAjar = '';
  int thisYear = DateTime.now().year;
  int thisMonth = DateTime.now().month;
  if (thisMonth > 6) {
    tahunAjar = thisYear.toString() + '/' + (thisYear + 1).toString();
  } else {
    tahunAjar = (thisYear - 1).toString() + '/' + thisYear.toString();
  }
  return tahunAjar;
}
