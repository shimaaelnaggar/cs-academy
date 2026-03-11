part of 'videos_cubit.dart';

@immutable
sealed class VideosState {}

final class VideosInitial extends VideosState {}

final class VideosLoading extends VideosState {}

final class VideosLoaded extends VideosState {
  final List<VideoModel> videos;

  VideosLoaded({required this.videos});
}

final class VideosFailure extends VideosState {
  final String errorMessage;

  VideosFailure({required this.errorMessage});
}
