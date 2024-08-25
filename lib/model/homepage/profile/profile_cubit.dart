import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'package:shamsi_date/shamsi_date.dart';
import 'package:sharif_health_app/provider/network.dart';
import 'package:sharif_health_app/provider/storage.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(ProfileInitial({})) {
    Future.microtask(() async =>
        emit(ProfileInitial(await NetworkProvider.getProfileData())));
  }

  onLogout() {
    emit(ProfileLogout(state.profileData,confirmed: false));
  }

  confirmLogout() async {
    await Storage.clear();
    emit(ProfileLogout(state.profileData,confirmed: true));
  }

  void backToProfile() async {
    Map<String, dynamic> data = await NetworkProvider.getProfileData();
    emit(ProfileInitial(data));
  }

  void onProfileEdit() async {
    emit(ProfileEdit(state.profileData));
  }

  void onDateEdit(String year, String month, String day) {
    Map<String, dynamic> data = (state as ProfileEdit).profileData;
    final DateTime gre =
        Jalali(int.parse(year), int.parse(month), int.parse(day)).toDateTime();
    data['birth_date'] = DateFormat('yyyy-MM-dd').format(gre);
    emit(ProfileEdit(data));
  }

  onEducationEdit(edu) {
    if (state is ProfileEdit) {
      Map<String, dynamic> data = (state as ProfileEdit).profileData;
      data['education'] = edu;
      emit(ProfileEdit(data));
    }
  }

  submitPersonalInfo(Map<String, dynamic> data) async {
    final res = await NetworkProvider.submitPersonalInfo(data);
    if (res) {
      debugPrint("ok");
    } else {
      debugPrint("nok");
    }
  }
}
