import 'package:cs_academy/features/videos/data/models/video_model.dart';
import 'package:dartz/dartz.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class VideoRepo {
  final supa = Supabase.instance.client;
  Future<Either<String, List<VideoModel>>> getVideos({
    required String courseId,
  }) async {
    try {
      final res = await supa.from('videos').select().eq('course_id', courseId);
      final List<VideoModel> videos = [];
      for (var video in res) {
        videos.add(VideoModel.fromJson(video));
      }
      return right(videos);
    } catch (e) {
      return Left(e.toString());
    }
  }
}
