import 'package:cs_academy/core/constants/app_colors.dart';
import 'package:cs_academy/core/routing/routes.dart';
import 'package:cs_academy/core/theme/text_styles.dart';
import 'package:cs_academy/core/widgets/custom_button.dart';
import 'package:cs_academy/core/widgets/functions.dart';
import 'package:cs_academy/features/subscribed_courses/data/repos/subscribed_courses_repo.dart';
import 'package:cs_academy/features/subscribed_courses/presentation/cubit/subscribed_courses_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SubscribedCourses extends StatelessWidget {
  const SubscribedCourses({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          SubscribedCoursesCubit(SubscribedCoursesRepo())..getMyCourses(),
      child: BlocConsumer<SubscribedCoursesCubit, SubscribedCoursesState>(
        listener: (context, state) {
          if (state is SubscribedCoursesError) {
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
              automaticallyImplyLeading: false,
              backgroundColor: Color(AppColors.secondaryColor),
              title: Center(
                child: Text(
                  "Subscribed Courses",
                  style: AppTextStyles.semiheading.copyWith(fontSize: 20),
                ),
              ),
            ),
            body: state is SubscribedCoursesLoading
                ? Center(
                    child: CircularProgressIndicator(
                      color: Color(AppColors.secondaryColor),
                    ),
                  )
                : state is SubscribedCoursesLoaded
                ? state.courses.isEmpty
                      ? Center(child: Text("Not Enrolled in courses yet"))
                      : SafeArea(
                          child: ListView.builder(
                            itemCount: state.courses.length,
                            itemBuilder: (BuildContext context, int index) {
                              return Padding(
                                padding: const EdgeInsets.only(top: 16,left: 16,right:16 ),
                                child: Card(
                                  elevation: 3,
                                  color: Color(AppColors.primaryColor),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(10),
                                    child: Row(
                                      children: [
                                        ClipRRect(
                                          borderRadius: BorderRadius.circular(
                                            12,
                                          ),
                                          child: Image.network(
                                            state.courses[index].img,
                                            width: 110,
                                            height: 90,
                                            fit: BoxFit.cover,
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

                                        const SizedBox(width: 12),

                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                state.courses[index].title,
                                                maxLines: 2,
                                                overflow: TextOverflow.ellipsis,
                                                style: AppTextStyles.s18bold,
                                              ),

                                              const SizedBox(height: 10),

                                              SizedBox(
                                                height: 38,
                                                child: CustomButton(
                                                  onPressed: () {
                                                    Navigator.pushNamed(
                                                      context,
                                                      Routes.videos,
                                                      arguments: state
                                                          .courses[index]
                                                          .id,
                                                    );
                                                  },
                                                  text: "Complete Course",
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        )
                : SizedBox(),
          );
        },
      ),
    );
  }
}
