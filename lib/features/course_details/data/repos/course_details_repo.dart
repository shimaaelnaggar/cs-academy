import 'package:dartz/dartz.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class CourseDetailsRepo {
  final supa = Supabase.instance.client;

  Future<Either<String, bool>> enrollmentsCourse({
    required String courseId,
    required String userId,
  }) async {
    try {
      await supa.from('enrollments').insert({
        'user_id': userId,
        'course_id': courseId,
      });

      return right(true);
    } catch (e) {
      return left(e.toString());
    }
  }

 Future<Either<String, bool>> checkEnrollment({
  required String courseId,
  required String userId,
}) async {
  try {
    final res = await supa
        .from('enrollments')
        .select()
        .eq('course_id', courseId)
        .eq('user_id', userId)
        .maybeSingle();

    return right(res != null);
  } catch (e) {
    return left(e.toString());
  }
}
}
