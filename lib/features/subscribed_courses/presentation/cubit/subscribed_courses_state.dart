part of 'subscribed_courses_cubit.dart';

@immutable
sealed class SubscribedCoursesState {}

final class SubscribedCoursesInitial extends SubscribedCoursesState {}

final class SubscribedCoursesLoading extends SubscribedCoursesState {}

final class SubscribedCoursesLoaded extends SubscribedCoursesState {
  final List<CourseModel> courses;

  SubscribedCoursesLoaded({required this.courses});
}

final class SubscribedCoursesError extends SubscribedCoursesState {
  final String errorMessage;

  SubscribedCoursesError({required this.errorMessage});
}
