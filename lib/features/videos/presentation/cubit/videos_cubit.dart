import 'package:cs_academy/features/videos/data/models/video_model.dart';
import 'package:cs_academy/features/videos/data/repos/video_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'videos_state.dart';

class VideosCubit extends Cubit<VideosState> {
  final VideoRepo videoRepo;
  VideosCubit(this.videoRepo) : super(VideosInitial());

  Future<void> getVideos({required String courseId}) async {
    emit(VideosLoading());
    final res = await videoRepo.getVideos(courseId: courseId);
    res.fold(
      (e) {
        emit(VideosFailure(errorMessage: e));
      },
      (video) {
        emit(VideosLoaded(videos: video));
      },
    );
  }
}
