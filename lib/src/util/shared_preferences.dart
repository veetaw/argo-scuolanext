import 'package:shared_preferences/shared_preferences.dart' as prefs;

class SharedPreferences {
  String _kFirstTime = "is_first_time";
  String _kLoggedIn = "is_logged";

  static final SharedPreferences instance =  SharedPreferences._();
  prefs.SharedPreferences sharedPreferences;

  factory SharedPreferences() => instance;

  SharedPreferences._();

  initPrefs() async =>
      sharedPreferences = await prefs.SharedPreferences.getInstance();

  bool get isFirstTime => sharedPreferences.getBool(_kFirstTime) ?? true;

  changeFirstTime() => sharedPreferences.setBool(_kFirstTime, !isFirstTime);

  bool get isLogged => sharedPreferences.getBool(_kLoggedIn) ?? false;

  setLogged() async => sharedPreferences.setBool(_kLoggedIn, !isLogged);
}
