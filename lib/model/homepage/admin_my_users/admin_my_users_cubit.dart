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
}
