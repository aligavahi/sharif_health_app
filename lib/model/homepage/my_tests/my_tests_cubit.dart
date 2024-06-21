import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:sharif_health_app/provider/network.dart';

part 'my_tests_state.dart';

class MyTestsCubit extends Cubit<MyTestsState> {
  MyTestsCubit() : super(const MyTestsInitial(tests: [])){
    NetworkProvider.getDeviceData().then(
            (value){
      emit(MyTestsDataReady(tests: DeviceData.fromListOfDict(value)));
            }
    );
  }
}
