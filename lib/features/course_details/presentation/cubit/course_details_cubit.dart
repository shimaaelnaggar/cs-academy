import 'package:cs_academy/features/course_details/data/repos/course_details_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'course_details_state.dart';

class CourseDetailsCubit extends Cubit<CourseDetailsState> {
  final CourseDetailsRepo courseDetailsRepo;
  CourseDetailsCubit(this.courseDetailsRepo) : super(CourseDetailsInitial());

  Future<void> enrollmentsCourse({
    required String courseId,
    required String userId,
  }) async {
    emit(CourseDetailsLoading());

    final res = await courseDetailsRepo.enrollmentsCourse(
      courseId: courseId,
      userId: userId,
    );
    res.fold(
      (error) {
        emit(CourseDetailsError(errorMessage: error.toString()));
      },
      (success) {
        emit(CourseDetailsLoaded());
      },
    );
  }

  Future<void> checkEnrollment({
    required String courseId,
    required String userId,
  }) async {
    emit(CourseDetailsLoading());

    final res = await courseDetailsRepo.checkEnrollment(
      courseId: courseId,
      userId: userId,
    );
    res.fold(
      (error) {
        emit(CourseDetailsError(errorMessage: error.toString()));
      },
      (isEnrolled) {
        if (isEnrolled) {
          emit(AlreadyEnrolled());
        } else {
          emit(NotEnrolled());
        }
      },
    );
  }
}
