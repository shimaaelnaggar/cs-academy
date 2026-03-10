
import 'package:cs_academy/features/home/data/models/course_model.dart';
import 'package:cs_academy/features/subscribed_courses/data/repos/subscribed_courses_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'subscribed_courses_state.dart';

class SubscribedCoursesCubit extends Cubit<SubscribedCoursesState> {
  final SubscribedCoursesRepo subscribedCoursesRepo;
  SubscribedCoursesCubit(this.subscribedCoursesRepo)
    : super(SubscribedCoursesInitial());

  Future<void> getMyCourses() async {
    emit(SubscribedCoursesLoading());
    final res = await subscribedCoursesRepo.getMyCourses();
    res.fold(
      (error) {
        emit(SubscribedCoursesError(errorMessage: error));
      },
      (courses) {
        emit(SubscribedCoursesLoaded(courses: courses));
      },
    );
  }
}
