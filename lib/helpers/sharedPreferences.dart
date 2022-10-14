import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesHelper {
  static SharedPreferences? _preferences;

  static const _keyNom = 'nom';
  static const _keyPrenoms = 'prenoms';
  static const _keyEmail = 'email';
  static const _keyPassword = 'password';
  static const _keyToken = 'token';

  static Future init() async =>
      _preferences = await SharedPreferences.getInstance();

  static Future setNom(String nom) async =>
      await _preferences?.setString(_keyNom, nom);

  static String? getNom() => _preferences?.getString(_keyNom);
  
  static Future setPrenoms(String prenoms) async =>
      await _preferences?.setString(_keyPrenoms, prenoms);

  static String? getPrenoms() => _preferences?.getString(_keyPrenoms);
  
  static Future setEmail(String email) async =>
      await _preferences?.setString(_keyEmail, email);

  static String? getEmail() => _preferences?.getString(_keyEmail);

  static Future setPassword(String password) async =>
      await _preferences?.setString(_keyPassword, password);

  static String? getPassword() => _preferences?.getString(_keyPassword);

  static Future setToken(String token) async =>
      await _preferences?.setString(_keyToken, token);

  static String? getToken() => _preferences?.getString(_keyToken);

  // static Future clear() async => _preferences.clear();
}
