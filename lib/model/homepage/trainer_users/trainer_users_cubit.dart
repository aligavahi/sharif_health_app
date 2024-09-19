import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:sharif_health_app/provider/network.dart';

part 'trainer_users_state.dart';




class TrainerUsersCubit extends Cubit<TrainerUsersState> {
  TrainerUsersCubit() : super(const TrainerUsersInitial(users: [])){
    NetworkProvider.getTrainerUsers().then((users)=>
    emit(TrainerUsersInitial(users: User.fromList(users))));
  }
}
