import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'package:meta/meta.dart';
import 'package:shamsi_date/shamsi_date.dart';
import 'package:sharif_health_app/provider/network.dart';

part 'my_tests_state.dart';

class MyTestsCubit extends Cubit<MyTestsState> {
  MyTestsCubit() : super(const MyTestsInitial(tests: [])) {
    NetworkProvider.getDeviceData().then((value) {
      emit(MyTestsDataReady(tests: DeviceData.fromListOfDict(value)));
    });
  }

  checkDetail(int index) {
    emit(MyTestsSeeDetail(tests: state.tests, dataIndex: index));
  }

  goBack() {
    emit(MyTestsDataReady(tests: state.tests));
  }

  goHistory(item) {
    if (state is MyTestsSeeDetail) {
      emit(MyTestsSeeHistory(
          name: item,
          tests: state.tests,
          dataIndex: (state as MyTestsSeeDetail).dataIndex));
    }
  }

  goBackDetail() {
    if (state is MyTestsSeeHistory) {
      emit(MyTestsSeeDetail(
          tests: state.tests,
          dataIndex: (state as MyTestsSeeHistory).dataIndex));
    }
  }
}
