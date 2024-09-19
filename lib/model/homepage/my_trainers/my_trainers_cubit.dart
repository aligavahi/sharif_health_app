import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:sharif_health_app/provider/network.dart';
import 'package:sharif_health_app/provider/storage.dart';

part 'my_trainers_state.dart';

class MyTrainersCubit extends Cubit<MyTrainersState> {
  MyTrainersCubit() : super(MyTrainersInitial(trainers: [])) {
    NetworkProvider.getAdminCenters().then((centers) {
      NetworkProvider.getAdminTrainers(
              centers[Storage.getSelectedDevice()]['device_id'])
          .then((trainers) {
        emit(MyTrainersInitial(trainers: Trainer.fromList(trainers)));
      });
    });
  }
}
