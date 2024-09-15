import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:sharif_health_app/model/homepage/homepage_cubit.dart';
import 'package:sharif_health_app/provider/network.dart';
import 'package:sharif_health_app/provider/storage.dart';

part 'my_devices_state.dart';

class MyDevicesCubit extends Cubit<MyDevicesState> {
  MyDevicesCubit() : super(MyDevicesInitial(devices: [], selected: 0)) {
    NetworkProvider.getAdminCenters().then((data) {
      emit(MyDevicesInitial(
          devices: DeviceCenterData.fromList(data), selected: 0));
    });
  }

  selectDevice(int index) {
    if (state is HomepageInitial) {
      Storage.saveSelectedDevice(index);
      emit(MyDevicesInitial(devices: state.devices, selected: index));
    }
  }
}
