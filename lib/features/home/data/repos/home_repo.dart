import 'package:cs_academy/features/home/data/models/course_model.dart';
import 'package:dartz/dartz.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class HomeRepo {
  List<CourseModel> courses = [];

  Future<Either<String, List<CourseModel>>> getCourses() async {
    try {
      final res = await Supabase.instance.client
          .from('courses')
          .select();
          // print(res);

      courses = [];

      for (var course in res) {
        courses.add(CourseModel.fromJson(course));
      }

      return right(courses);
    } catch (e) {
      return left(e.toString());
    }
  }
}