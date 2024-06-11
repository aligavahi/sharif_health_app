part of 'login_cubit.dart';

@immutable
sealed class LoginState {
  final String phoneNumber;
  final String secret;

  const LoginState(this.phoneNumber, this.secret);
}

final class LoginFirstPage extends LoginState {
  const LoginFirstPage(super.phoneNumber, super.code);
}

final class LoginInitial extends LoginState {
  const LoginInitial(super.phoneNumber, super.code);
}

final class LoginCodeSent extends LoginState {
  const LoginCodeSent(super.phoneNumber, super.code);
}

final class LoginFailedCode extends LoginState {
  const LoginFailedCode(super.phoneNumber, super.code);
}

final class LoginFailedSms extends LoginState {
  const LoginFailedSms(super.phoneNumber, super.code);
}

final class LoginSuccess extends LoginState {
  const LoginSuccess(super.phoneNumber, super.code);
}



