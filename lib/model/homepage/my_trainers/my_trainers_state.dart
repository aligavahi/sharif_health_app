part of 'my_trainers_cubit.dart';

class Trainer {
  final String firsName;
  final String lastName;
  final String accountId;
  final String phoneNumber;

  Trainer(
      {required this.firsName,
      required this.lastName,
      required this.accountId,
      required this.phoneNumber});
}

@immutable
sealed class MyTrainersState {}

final class MyTrainersInitial extends MyTrainersState {}
