part of 'my_trainers_cubit.dart';

class Trainer {
  final String firstName;
  final String lastName;
  final int accountId;
  final String phoneNumber;

  Trainer(
      {required this.firstName,
      required this.lastName,
      required this.accountId,
      required this.phoneNumber});

  static List<Trainer> fromList(List<Map> mapList) {
    return mapList.map((item) => fromJson(item)).toList();
  }

  static Trainer fromJson(Map item) {
    Trainer trainer = Trainer(
        firstName: item['first_name']??"",
        lastName: item['last_name']??"",
        accountId: (item['account_id']=="")?-1:item['account_id'],
        phoneNumber: item['mobile_number']??"");
    return trainer;
  }
}

@immutable
sealed class MyTrainersState {
  final List<Trainer> trainers;

  const MyTrainersState({required this.trainers});
}

final class MyTrainersInitial extends MyTrainersState {
  const MyTrainersInitial({required super.trainers});
}
