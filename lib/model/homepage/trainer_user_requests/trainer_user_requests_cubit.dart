import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'trainer_user_requests_state.dart';

class TrainerUserRequestsCubit extends Cubit<TrainerUserRequestsState> {
  TrainerUserRequestsCubit() : super(TrainerUserRequestsInitial());
}
