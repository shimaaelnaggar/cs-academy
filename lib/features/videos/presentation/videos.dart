import 'package:cs_academy/core/constants/app_colors.dart';
import 'package:cs_academy/core/routing/routes.dart';
import 'package:cs_academy/core/theme/text_styles.dart';
import 'package:cs_academy/core/widgets/functions.dart';
import 'package:cs_academy/features/videos/data/repos/video_repo.dart';
import 'package:cs_academy/features/videos/presentation/cubit/videos_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class VideosView extends StatelessWidget {
  final String courseId;
  const VideosView({super.key, required this.courseId});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          VideosCubit(VideoRepo())..getVideos(courseId: courseId),
      child: BlocConsumer<VideosCubit, VideosState>(
        listener: (context, state) {
          if (state is VideosFailure) {
            snackBar(
              text: state.errorMessage,
              context: context,
              color: Color(AppColors.errorColor),
            );
          }
        },
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Color(AppColors.secondaryColor),
              title: Center(
                child: Text(
                  "Course Videos",
                  style: AppTextStyles.semiheading.copyWith(fontSize: 20),
                ),
              ),
              leading: IconButton(
                icon: Icon(
                  Icons.arrow_back,
                  color: Color(AppColors.primaryColor),
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
            body: SafeArea(
              child: state is VideosLoading
                  ? Center(
                      child: CircularProgressIndicator(
                        color: Color(AppColors.secondaryColor),
                      ),
                    )
                  : state is VideosLoaded
                  ? state.videos.isEmpty
                        ? Center(child: Text('No videos added yet!'))
                        : Padding(
                            padding: const EdgeInsets.only(top: 16),
                            child: ListView.builder(
                              itemCount: state.videos.length,
                              itemBuilder: (BuildContext context, int index) {
                                //  print(state.videos[index].image);
                                return ListTile(
                                  leading: ClipRRect(
                                    borderRadius: BorderRadius.circular(12),
                                    child: Image.network(
                                        state.videos[index].image,
                                      width: 110,
                                      height: 90,
                                      fit: BoxFit.cover,

                                      loadingBuilder:
                                          (context, child, progress) {
                                            if (progress == null) return child;
                                           
                                            return const SizedBox(
                                              width: 110,
                                              height: 90,
                                              child: Center(
                                                child:
                                                    CircularProgressIndicator(),
                                              ),
                                            );
                                          },

                                      errorBuilder:
                                          (context, error, stackTrace) {
                                            return Container(
                                              width: 110,
                                              height: 90,
                                              color: Colors.grey[300],
                                              child: const Icon(
                                                Icons.broken_image,
                                              ),
                                            );
                                          },
                                    ),
                                  ),
                                  title: Text(
                                    state.videos[index].title,
                                    style: AppTextStyles.s14bold.copyWith(
                                      fontSize: 16,
                                      color: Color(0xff0F172A),
                                    ),
                                  ),
                                  subtitle: Text(
                                    state.videos[index].desc,
                                    style: AppTextStyles.regular.copyWith(
                                      fontSize: 12,
                                      color: Color(0xff64748B),
                                    ),
                                  ),
                                  trailing: Container(
                                    decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Color(AppColors.secondaryColor),
                                    ),
                                    child: IconButton(
                                      icon: const Icon(
                                        Icons.play_arrow,
                                        color: Color(AppColors.primaryColor),
                                      ),
                                      onPressed: () {
                                        Navigator.pushNamed(
                                          context,
                                          Routes.videoPlayer,
                                          arguments: state.videos[index],
                                        );
                                      },
                                    ),
                                  ),
                                );
                              },
                            ),
                          )
                  : SizedBox(),
            ),
          );
        },
      ),
    );
  }
}
