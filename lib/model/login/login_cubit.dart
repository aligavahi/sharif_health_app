import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:sharif_health_app/provider/network.dart';
import 'package:sharif_health_app/provider/storage.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(const LoginFirstPage("", "")) {
    Storage.loadStorage().whenComplete(() {
      if (Storage.getToken().isNotEmpty) {
        emit(const LoginSuccess("", ""));
      }
    });
  }

  updatePhoneNumber(phoneNumber) {
    emit(LoginInitial(phoneNumber, ''));
  }

  sendSms() async {
    String secret = await NetworkProvider.sendSMS(state.phoneNumber);
    if (secret.isNotEmpty) {
      emit(LoginCodeSent(state.phoneNumber, secret));
    } else {
      emit(LoginFailedSms(state.phoneNumber, ''));
    }
  }

  login(code) async {
    String token =
        await NetworkProvider.signup(state.phoneNumber, state.secret, code);

    if (token.isNotEmpty) {
      Storage.saveToken(token);
      emit(LoginSuccess(state.phoneNumber, state.secret));
    } else {
      emit(LoginFailedCode(state.phoneNumber, state.secret));
    }
  }

  goPhoneNumber() {
    emit(const LoginInitial("", ""));
  }
}
