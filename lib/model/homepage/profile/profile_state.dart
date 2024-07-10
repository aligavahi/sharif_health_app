part of 'profile_cubit.dart';

final class ProfileState {
   final Map<String,dynamic> profileData;

  ProfileState(this.profileData);

}

final class ProfileInitial extends ProfileState {

  ProfileInitial(super.profileData);

}

final class ProfileEdit extends ProfileState {
  ProfileEdit(super.profileData);
}

final class ProfileMessage extends ProfileState {
  ProfileMessage(super.profileData);
}

final class ProfileTransactionHistory extends ProfileState {
  ProfileTransactionHistory(super.profileData);
}

final class ProfileContactUs extends ProfileState {
  ProfileContactUs(super.profileData);
}

final class ProfileShare extends ProfileState {
  ProfileShare(super.profileData);
}

final class ProfileLogout extends ProfileState {
  final bool confirmed;

  ProfileLogout(super.profileData, {required this.confirmed});
}
