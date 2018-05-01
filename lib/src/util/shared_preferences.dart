import 'package:shared_preferences/shared_preferences.dart' as prefs;

class SharedPreferences {
  String _kFirstTime = "is_first_time";

  static final SharedPreferences instance = new SharedPreferences._();
  prefs.SharedPreferences sharedPreferences;

  factory SharedPreferences() => instance;

  SharedPreferences._();

  initPrefs() async =>
      sharedPreferences = await prefs.SharedPreferences.getInstance();

  bool isFirstTime() => sharedPreferences.getBool(_kFirstTime) ?? true;

  changeFirstTime() async =>
      sharedPreferences.setBool(_kFirstTime, !isFirstTime());
}
