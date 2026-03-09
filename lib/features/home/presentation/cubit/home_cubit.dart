import 'package:cs_academy/features/home/data/models/course_model.dart';
import 'package:cs_academy/features/home/data/repos/home_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final HomeRepo homeRepo;

  HomeCubit({required this.homeRepo}) : super(HomeInitial());

  Future<void> getCourses() async {
    emit(HomeLoading());

    try {
      final res = await homeRepo.getCourses();

      res.fold(
        (error) {
          emit(HomeError(errorMessage: error));
        },
        (courses) {
          emit(HomeLoaded(courses: courses));
        },
      );
    } catch (e) {
      emit(HomeError(errorMessage: e.toString()));
    }
  }
}
