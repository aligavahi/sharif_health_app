import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'homepage_state.dart';

class HomepageCubit extends Cubit<HomepageState> {
  HomepageCubit() : super(const HomepageInitial(pageNumber: 0));

  changePage(pageNumber) {
    emit(HomepageInitial(pageNumber: pageNumber));
  }
}
