part of 'course_details_cubit.dart';

@immutable
sealed class CourseDetailsState {}

final class CourseDetailsInitial extends CourseDetailsState {}

final class CourseDetailsLoading extends CourseDetailsState {}

final class CourseDetailsLoaded extends CourseDetailsState {}

final class CourseDetailsError extends CourseDetailsState {
  final String errorMessage;

  CourseDetailsError({required this.errorMessage});
}

final class AlreadyEnrolled extends CourseDetailsState{}

final class NotEnrolled extends CourseDetailsState{}