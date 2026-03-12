import 'package:cs_academy/core/routing/routes.dart';
import 'package:cs_academy/features/auth/presentation/views/login_view.dart';
import 'package:cs_academy/features/auth/presentation/views/sign_up_view.dart';
import 'package:cs_academy/features/course_details/presentation/views/course_details.dart';
import 'package:cs_academy/features/home/data/models/course_model.dart';
import 'package:cs_academy/features/home/presentation/views/home.dart';
import 'package:cs_academy/features/layout/presentation/views/layout_bottom_nav_bar_view.dart';
import 'package:cs_academy/features/profile/presentation/views/edit_profile.dart';
import 'package:cs_academy/features/splash/presentation/views/splash_view.dart';
import 'package:cs_academy/features/subscribed_courses/presentation/views/subscribed_courses.dart';
import 'package:cs_academy/features/videos/data/models/video_model.dart';
import 'package:cs_academy/features/videos/presentation/videos.dart';
import 'package:cs_academy/features/videos/presentation/views/video_player_view.dart';
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
      case Routes.subscribedCourses:
        return MaterialPageRoute(builder: (_) => SubscribedCourses());
      case Routes.layout:
        return MaterialPageRoute(builder: (_) => LayoutBottomNavBarView());
      case Routes.videos:
        final courseId = settings.arguments as String;
        return MaterialPageRoute(
          builder: (_) => VideosView(courseId: courseId),
        );
      case Routes.videoPlayer:
        final args = settings.arguments;
        VideoModel videoModel;

        if (args is Set<VideoModel>) {
          videoModel = args.first; // take the first video
        } else if (args is VideoModel) {
          videoModel = args;
        } else {
          throw Exception('Invalid arguments for VideoPlayerView');
        }

        return MaterialPageRoute(
          builder: (_) => VideoPlayerView(videoModel: videoModel),
        );
        case Routes.editProfile:
        return MaterialPageRoute(builder: (_) => EditProfile());
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(child: Text('No route defined for ${settings.name}')),
          ),
        );
    }
  }
}
