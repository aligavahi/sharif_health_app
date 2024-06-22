import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class StorageModel {
  String token = "";
}

class Storage {
  static const String _tokenKey = 'token';
  static const String _userDataKey = 'user_data';
  static StorageModel model = StorageModel();

  static loadStorage() async {
    await loadToken();
  }

  static Future<void> saveToken(String token) async {
    model.token = token;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(_tokenKey, token);
  }

  static loadToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    model.token = prefs.getString(_tokenKey) ?? '';
  }

  static String getToken() {
    return model.token;
  }

  static Future<void> saveUserData(Map<String, dynamic> userData) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(_userDataKey, jsonEncode(userData));
  }

  static Future<Map<String, dynamic>> getUserData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String userDataString = prefs.getString(_userDataKey) ?? '';
    return jsonDecode(userDataString);
  }
}
