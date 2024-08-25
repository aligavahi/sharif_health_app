import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:meta/meta.dart';
import 'package:sharif_health_app/provider/network.dart';

part 'homepage_state.dart';

class HomepageCubit extends Cubit<HomepageState> {
  HomepageCubit()
      : super(const HomepageInitial(
            pageNumber: 0, roles: [Role.trainee], selectedRole: Role.trainee)) {
    NetworkProvider.getRoles().then((roles) {
      emit(state.copyWith(
          roles: roles.map<Role>((String name) => name.parseRole).toList()));
    });
  }

  changePage(pageNumber) {
    emit(HomepageInitial(
        pageNumber: pageNumber,
        roles: state.roles,
        selectedRole: state.selectedRole));
  }

  changeRole(Role role) {
    emit(state.copyWith(roles: state.roles, selectedRole: role, pageNumber: 0));
  }
}
