import 'package:shared_preferences/shared_preferences.dart';

class Prefs {
  Prefs._privateConstructor();

  static final Prefs _instance = Prefs._privateConstructor();

  static const _token = 'token';

  factory Prefs() {
    return _instance;
  }

  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  void _setString(String key, String saveValue) async {
    final prefs = await _prefs;
    prefs.setString(key, saveValue);
  }

  Future<String?> _getString(String key) async {
    final prefs = await _prefs;
    return prefs.getString(key);
  }

  Future<void> _removePref(String key) async {
    final prefs = await _prefs;
    prefs.remove(key);
  }

  void setToken(String token) => _setString(_token, token);

  void deleteToken() => _removePref(_token);

  Future<String?> getToken() async {
    return await _getString(_token);
  }

  Future<bool> isAuthorized() async {
    return await getToken() != null;
  }
}
