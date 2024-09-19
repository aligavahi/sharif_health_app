part of 'trainer_users_cubit.dart';

class User {
  final String firstName;
  final String lastName;
  final String mobileNumber;
  final int accountId;

  User(
      {required this.firstName,
      required this.lastName,
      required this.mobileNumber,
      required this.accountId});

  static List<User> fromList(List<Map> jsonList) {
    print(jsonList);
    return jsonList
        .map((item) => User(
            firstName: item['first_name'],
            lastName: item['last_name'],
            mobileNumber: item['mobile_number'],
            accountId: item['account_id']))
        .toList();
  }
}

@immutable
sealed class TrainerUsersState {
  final List<User> users;

  const TrainerUsersState({required this.users});
}

final class TrainerUsersInitial extends TrainerUsersState {
  const TrainerUsersInitial({required super.users});
}
