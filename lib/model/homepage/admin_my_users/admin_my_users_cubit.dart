import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:sharif_health_app/model/homepage/my_trainers/my_trainers_cubit.dart';
import 'package:sharif_health_app/provider/network.dart';
import 'package:sharif_health_app/provider/storage.dart';

part 'admin_my_users_state.dart';

class AdminMyUsersCubit extends Cubit<AdminMyUsersState> {
  AdminMyUsersCubit() : super(const AdminMyUsersInitial(users: [])) {
    NetworkProvider.getAdminCenters().then((centers) {
      NetworkProvider.getAdminUsers(
              centers[Storage.getSelectedDevice()]['device_id'])
          .then((trainers) {
        emit(AdminMyUsersInitial(users: User.fromList(trainers)));
      });
    });
  }

  goToDetailUser(userIndex) {
    emit(AdminMyUsersSelectUser(selectedUser: userIndex, users: state.users));
  }

  goToPermissionDialog() {
    if (state is AdminMyUsersSelectUser) {
      emit(AdminMyUsersChangePermission(
          testCount: 0,
          expireDay: 0,
          selectedUser: (state as AdminMyUsersSelectUser).selectedUser,
          users: state.users));
    }
  }

  editPermissionDialog({int? testCount, int? day}) {
    if (state is AdminMyUsersSelectUser) {
      emit(AdminMyUsersChangePermission(
          dialogIsDown: false,
          testCount:
              testCount ?? (state as AdminMyUsersChangePermission).testCount,
          expireDay: day ?? (state as AdminMyUsersChangePermission).expireDay,
          selectedUser: (state as AdminMyUsersChangePermission).selectedUser,
          users: state.users));
    }
  }

  submitPermission() async {
    if (state is AdminMyUsersChangePermission) {
      Map<String, dynamic> data = {
        "account_id": state
            .users[(state as AdminMyUsersChangePermission).selectedUser]
            .accountId,
        "device_id": (await NetworkProvider.getAdminCenters())[
            Storage.getSelectedDevice()]['device_id'],
        "test_count": (state as AdminMyUsersChangePermission).testCount,
        "test_day": (state as AdminMyUsersChangePermission).expireDay
      };
      print(await NetworkProvider.submitPermission(data));
      emit(AdminMyUsersInitial(users: state.users));
    }
  }

  goBack() {
    if (state is AdminMyUsersSelectUser) {
      emit(AdminMyUsersInitial(users: state.users));
    }
  }
}
