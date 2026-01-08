part of app_theme;

class _TextStyles {
  static TextStyle app = const TextStyle(fontWeight: FontWeight.normal);
  static TextStyle appBold = const TextStyle(fontWeight: FontWeight.bold);

  static TextStyle text10 = app.copyWith(fontSize: 10);
  static TextStyle text12 = app.copyWith(fontSize: 12);
  static TextStyle text14 = app.copyWith(fontSize: 14);

  static TextStyle title16 = appBold.copyWith(fontSize: 16);
  static TextStyle title18 = appBold.copyWith(fontSize: 18);

  static TextStyle h24 = appBold.copyWith(fontSize: 24);
  static TextStyle h30 = appBold.copyWith(fontSize: 30);
  static TextStyle h34 = appBold.copyWith(fontSize: 34);
}
