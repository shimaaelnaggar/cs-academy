import 'package:cs_academy/features/home/data/models/course_model.dart';
import 'package:dartz/dartz.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SubscribedCoursesRepo {
  final supa = Supabase.instance.client;
  final userId = Supabase.instance.client.auth.currentUser!.id;

  Future<Either<String, List<CourseModel>>> getMyCourses() async {
    try {
      final res = await supa
          .from('enrollments')
          .select('courses(*)')
          .eq('user_id', userId);
      List<CourseModel> courses = [];
      for (var course in res) {
        courses.add(CourseModel.fromJson(course['courses']));
      }
      return right(courses);
    } catch (e) {
      return left(e.toString());
    }
  }
}
