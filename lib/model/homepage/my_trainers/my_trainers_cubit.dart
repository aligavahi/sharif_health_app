import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'my_trainers_state.dart';

class MyTrainersCubit extends Cubit<MyTrainersState> {
  MyTrainersCubit() : super(MyTrainersInitial());
}
