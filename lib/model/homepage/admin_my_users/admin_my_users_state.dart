part of 'admin_my_users_cubit.dart';

class User {
  final String firstName;
  final String lastName;
  final String phoneNumber;
  final int testCount;
  final int approvedTestCount;
  final Trainer trainer;

  final int accountId;

  User(this.accountId, this.firstName, this.lastName, this.phoneNumber,
      this.testCount, this.approvedTestCount, this.trainer);

  static List<User> fromList(List<Map> listMap) {
    print(listMap);

    return listMap
        .map((item) => User(
            item['account_id'],
            item['first_name'],
            item['last_name'],
            item['mobile_number'],
            item['test_count'],
            item['approved_test_count'],
            Trainer.fromJson(item['trainer'])))
        .toList();
  }
}

@immutable
sealed class AdminMyUsersState {
  final List<User> users;

  const AdminMyUsersState({required this.users});
}

final class AdminMyUsersInitial extends AdminMyUsersState {
  const AdminMyUsersInitial({required super.users});
}

final class AdminMyUsersSelectUser extends AdminMyUsersState {
  final int selectedUser;

  const AdminMyUsersSelectUser(
      {required super.users, required this.selectedUser});
}

final class AdminMyUsersChangePermission extends AdminMyUsersSelectUser {
  final int testCount;
  final int expireDay;

  final bool dialogIsDown;

  const AdminMyUsersChangePermission(
      {this.dialogIsDown = true,
      required this.testCount,
      required this.expireDay,
      required super.users,
      required super.selectedUser});
}
