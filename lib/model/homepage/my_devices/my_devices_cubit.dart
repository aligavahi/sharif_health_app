import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:sharif_health_app/provider/network.dart';

part 'my_devices_state.dart';

class MyDevicesCubit extends Cubit<MyDevicesState> {
  MyDevicesCubit() : super(MyDevicesInitial(devices: [], selected: 0)) {
    NetworkProvider.getAdminCenters().then((data) {
      emit(MyDevicesInitial(devices: DeviceCenterData.fromList(data), selected: 0));
    });
  }
}
