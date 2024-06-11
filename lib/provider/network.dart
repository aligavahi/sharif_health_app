import 'dart:convert';
import 'package:http/http.dart' as http;

class NetworkProvider {
  static String host = "ezcar.ir";
  static int port = 8569;
  static String urlSignup = 'signup';
  static String urlSendSms = 'send_sms';
  static String urlLogin = 'login';
  static String urlUpdateAccountInfo = 'update_account_info';
  static String urlGetAccountInfo = 'get_account_info';
  static String urlAddDeviceData = 'add_device_data';
  static String urlGetDeviceData = 'get_device_data';

  static Future<http.Response> request(String path, Map<String,dynamic> data) async {
    print(json.encode(data));
    final response = await http.post(
      Uri.parse('https://$host:$port/$path/'),
      headers: <String, String>{
        'Content-Type': 'application/json',
      },
      body: json.encode(data),
    );
    return response;
  }

  static Future<bool> postData(String path, Map<String,dynamic> data) async {
    http.Response response = await request(path, data);
    if (response.statusCode == 200) {
      try {
        data = json.decode(response.body);
        if (data['status'] == 'success') {
          return true;
        }
        return false;
      } catch (e) {
        return false;
      }
    }
    return false;
  }

  static Future<Map> getData(String path, Map<String,dynamic> data) async {
    http.Response response = await request(path, data);
    if (response.statusCode == 200) {
      try {
        data = jsonDecode(response.body);
        if (data['status'] == 'success') {
          return data;
        }
        return {};
      } catch (e) {
        return {};
      }
    }
    return {};
  }

  static Future<String> sendSMS(String phoneNumber) async {
    Map data = await getData(urlSendSms,
        {'mobile_number': phoneNumber.substring(phoneNumber.length - 10)});
    if (data.isNotEmpty) {
      return data['secret'];
    }
    return '';
  }

  static Future<String> loginSMS(
      String phoneNumber, String secret, String code) async {
    return signup(phoneNumber, secret, code);
  }

  static Future<String> signup(String phoneNumber, String secret, String code) async {
    Map data = await getData(urlSignup, {
      'mobile_number': phoneNumber.substring(phoneNumber.length - 10),
      'secret': secret,
      'code': code
    });
    if (data.isNotEmpty) {
      return data['token'];
    }
    return '';
  }
}
