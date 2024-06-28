part of 'profile_cubit.dart';

@immutable
sealed class ProfileState {}

final class ProfileInitial extends ProfileState {}

final class ProfileEdit extends ProfileState {}

final class ProfileMessage extends ProfileState {}

final class ProfileTransactionHistory extends ProfileState {}

final class ProfileContactUs extends ProfileState {}

final class ProfileShare extends ProfileState {}

final class ProfileLogout extends ProfileState {
  final bool confirmed;

  ProfileLogout({required this.confirmed});
}
