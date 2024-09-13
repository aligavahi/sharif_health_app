part of 'my_devices_cubit.dart';

class DeviceCenterData {
  final String name;
  final String deviceId;
  final String address;

  DeviceCenterData(
      {required this.name, required this.deviceId, required this.address});

  static List<DeviceCenterData> fromList(List<Map> data) {
    List<DeviceCenterData> allData = [];
    for (Map deviceData in data) {
      allData.add(DeviceCenterData(
          name: deviceData['name'],
          deviceId: deviceData['device_id'],
          address: deviceData['address']));
    }
    return allData;
  }
}

@immutable
sealed class MyDevicesState {}

final class MyDevicesInitial extends MyDevicesState {
  final List<DeviceCenterData> devices;

  final int selected;

  MyDevicesInitial({required this.devices, required this.selected});
}
