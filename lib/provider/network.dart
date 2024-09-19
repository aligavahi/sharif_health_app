import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:sharif_health_app/provider/storage.dart';

class NetworkProvider {
  static String namespace = 'api';
  static String host = "app.healthapp.ir";
  static int port = 80;
  static String urlSignup = 'signup';
  static String urlSendSms = 'send_sms';
  static String urlLogin = 'login';
  static String urlUpdateAccountInfo = 'update_account_info';
  static String urlGetAccountInfo = 'get_account_info';
  static String urlAddDeviceData = 'add_device_data';
  static String urlGetDeviceData = 'get_device_data';
  static String urlSendDiet = 'send_diet';
  static String urlSendTrain = 'send_train';
  static String urlAddPermission = 'add_permission';
  static String urlAddTrainerToCenter = 'add_trainer_to_center';
  static String urlListAdminTrainers = 'list_admin_trainers';
  static String urlEditCenter = 'edit_center';
  static String urlRemoveTrainerFromCenter = 'remove_trainer_from_center';
  static String urlListTraineeRequests = 'list_trainee_requests';
  static String urlListTrainees = 'list_trainees';
  static String urlListAdminCenters = 'list_admin_centers';
  static String urlListTrainerCenters = 'list_trainer_centers';
  static String urlListTraineeTests = 'list_trainee_tests';
  static String urlListAdminTrainees = 'list_admin_trainees';
  static String urlListRoles = 'list_roles';

  static Future<http.Response> request(String path, Map<String, dynamic> data,
      {Map<String, String> headers = const {}}) async {
    final reqHeaders = <String, String>{
      "Access-Control-Allow-Origin": "*",
      'Content-Type': 'application/json',
      'AUTHORIZATION': "Bearer ${Storage.getToken()}"
    };
    reqHeaders.addAll(headers);
    final response = await http.post(
      Uri.parse('https://$host/$namespace/$path/'),
      headers: reqHeaders,
      body: json.encode(data),
    );
    return response;
  }

  static Future<bool> postData(String path, Map<String, dynamic> data,
      {Map<String, String> headers = const {}}) async {
    http.Response response = await request(path, data, headers: headers);
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

  static Future<Map> getData(String path, Map<String, dynamic> data,
      {Map<String, String> headers = const {}}) async {
    http.Response response = await request(path, data, headers: headers);
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

  static Future<String> signup(
      String phoneNumber, String secret, String code) async {
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

  static Future<List<Map>> getDeviceData() async {
    Map data = await getData(urlGetDeviceData, {});
    if (data.isNotEmpty) {
      List<dynamic> dataList = data['data'];

      List<Map> result = [];
      dataList.forEach((val) => result.add(val));
      return result;
    } else {
      return [];
    }
  }

  static Future<bool> submitPersonalInfo(Map<String, dynamic> data) async {
    return await postData(urlUpdateAccountInfo, data);
  }

  static Future<Map<String, dynamic>> getProfileData() async {
    Map data = await getData(urlGetAccountInfo, {});
    if (data.isNotEmpty) {
      Map<String, dynamic> dataInfo = data['data'];
      return dataInfo;
    } else {
      return {};
    }
  }

  static Future<List<String>> getRoles() async {
    Map data = await getData(urlListRoles, {});
    if (data.isNotEmpty) {
      List<String> roles = List<String>.from(data['roles']);
      return roles;
    } else {
      return [];
    }
  }

  static Future<List<Map>> getAdminCenters() async {
    Map data = await getData(urlListAdminCenters, {});
    if (data.isNotEmpty) {
      List<Map> roles = List<Map>.from(data['centers']);
      return roles;
    } else {
      return [];
    }
  }

  static Future<List<Map>> getAdminTrainers(String device_id) async {
    Map data = await getData(urlListAdminTrainers, {"device_id": device_id});
    if (data.isNotEmpty) {
      List<Map> trainers = List<Map>.from(data['trainers']);
      return trainers;
    } else {
      return [];
    }
  }

  static Future<List<Map>> getAdminUsers(String device_id) async{
    Map data = await getData(urlListAdminTrainees, {"device_id": device_id});
    if (data.isNotEmpty) {
      List<Map> trainers = List<Map>.from(data['trainees']);
      return trainers;
    } else {
      return [];
    }
  }

  static Future<List<Map>>  getTrainerUsers() async{
    Map data = await getData(urlListTrainees, {});
    if (data.isNotEmpty) {
      print(data);
      List<Map> trainers = List<Map>.from(data['trainees']);
      return trainers;
    } else {
      return [];
    }
  }
  static Future<bool> submitPermission(Map<String, dynamic> data) async {
    print(data);
    return await postData(urlAddPermission, data);
  }
}
