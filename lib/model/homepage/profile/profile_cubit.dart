import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:sharif_health_app/provider/storage.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(ProfileInitial());

  onLogout(){
    emit(ProfileLogout(confirmed: false));
  }

  confirmLogout() async{
    await Storage.clear();
    emit(ProfileLogout(confirmed: true));
  }

  void backToProfile() {
    emit(ProfileInitial());
  }

}



