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
    model.token = '70d4c21790f94823dee3f677f7e4d1de'; // todo: remove this line
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
