part of 'homepage_cubit.dart';

@immutable
sealed class HomepageState {
  final int pageNumber;

  const HomepageState({required this.pageNumber});
}

final class HomepageInitial extends HomepageState {
  const HomepageInitial({required super.pageNumber});
}
