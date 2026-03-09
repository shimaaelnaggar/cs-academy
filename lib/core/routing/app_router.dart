import 'package:cs_academy/core/routing/routes.dart';
import 'package:cs_academy/features/auth/presentation/views/login_view.dart';
import 'package:cs_academy/features/auth/presentation/views/sign_up_view.dart';
import 'package:cs_academy/features/course_details/presentation/views/course_details.dart';
import 'package:cs_academy/features/home/data/models/course_model.dart';
import 'package:cs_academy/features/home/presentation/views/home.dart';
import 'package:cs_academy/features/splash/presentation/views/splash_view.dart';
import 'package:flutter/material.dart';

class AppRouter {
  Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splash:
        return MaterialPageRoute(builder: (_) => SplashView());
      case Routes.login:
        return MaterialPageRoute(builder: (_) => LoginView());
      case Routes.signUp:
        return MaterialPageRoute(builder: (_) => SignUpView());
      case Routes.home:
        return MaterialPageRoute(builder: (_) => Home());
      case Routes.courseDetails:
        final course = settings.arguments as CourseModel;
        return MaterialPageRoute(builder: (_) => CourseDetails(course: course));
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(child: Text('No route defined for ${settings.name}')),
          ),
        );
    }
  }
}
