import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sharif_health_app/utils/env.dart';

class StorageModel {
  String token = "";
  int selectedDevice = 0;
}

class Storage {
  static RunEnvironment runEnvironment = RunEnvironment.prod;
  static const String _tokenKey = 'token';
  static const String _userDataKey = 'user_data';
  static const String _selectedDeviceKey = 'selectedDevice';
  static StorageModel model = StorageModel();

  static loadStorage() async {
    await loadToken();
    await loadSelectedDevice();
  }

  static Future<void> clear() async {
    await clearToken();
    await clearSelectedDevice();
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

  static Future<void> clearToken() async {
    model.token = "";
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove(_tokenKey);
  }

  static Future<void> saveToken(String token) async {
    model.token = token;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(_tokenKey, token);
  }

  static loadToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (runEnvironment == RunEnvironment.dev) {
      model.token = 'ac04cf6907f40ddd7200f4b8522a4a11';
    } else {
      model.token = prefs.getString(_tokenKey) ?? '';
    }
  }

  static String getToken() {
    return model.token;
  }

  static clearSelectedDevice() async {
    model.selectedDevice = 0;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove(_selectedDeviceKey);
  }

  static loadSelectedDevice() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    model.selectedDevice = prefs.getInt(_selectedDeviceKey) ?? 0;
  }

  static int getSelectedDevice() {
    return model.selectedDevice;
  }

  static void saveSelectedDevice(int index) {
    model.selectedDevice = index;
  }
}
