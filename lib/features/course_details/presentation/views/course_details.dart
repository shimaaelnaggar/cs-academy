import 'package:cs_academy/core/constants/app_colors.dart';
import 'package:cs_academy/core/theme/text_styles.dart';
import 'package:cs_academy/core/widgets/custom_button.dart';
import 'package:cs_academy/core/widgets/functions.dart';
import 'package:cs_academy/features/course_details/data/repos/course_details_repo.dart';
import 'package:cs_academy/features/course_details/presentation/cubit/course_details_cubit.dart';
import 'package:cs_academy/features/home/data/models/course_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class CourseDetails extends StatelessWidget {
  const CourseDetails({super.key, required this.course});
  final CourseModel course;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CourseDetailsCubit(CourseDetailsRepo())
        ..checkEnrollment(
          courseId: course.id,
          userId: Supabase.instance.client.auth.currentUser!.id,
        ),
      child: BlocConsumer<CourseDetailsCubit, CourseDetailsState>(
        listener: (context, state) {
          if (state is CourseDetailsError) {
            snackBar(
              text: state.errorMessage,
              context: context,
              color: Color(AppColors.errorColor),
            );
          }
          if (state is CourseDetailsLoaded) {
            snackBar(
              text: 'Enrolled Successfully!',
              context: context,
              color: Color(AppColors.successColor),
            );
          }
        },
        builder: (context, state) {
          return Scaffold(
            backgroundColor: Color(AppColors.primaryColor),
            appBar: AppBar(
              backgroundColor: Color(AppColors.secondaryColor),
              leading: IconButton(
                icon: Icon(
                  Icons.arrow_back,
                  color: Color(AppColors.primaryColor),
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              title: Text(
                "Course Details",
                style: AppTextStyles.semiheading.copyWith(fontSize: 20),
              ),
            ),
            body: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.network(
                        course.img,
                        width: double.infinity,
                        height: MediaQuery.sizeOf(context).height * 0.35,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          return const Center(child: Icon(Icons.broken_image));
                        },
                      ),
                    ),
              
                    const SizedBox(height: 20),
                    Text(
                      course.title,
                      style: AppTextStyles.semiheading.copyWith(
                        color: AppColors.darkBlueColor,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      "${course.price.toString()} USD",
                      style: AppTextStyles.semiheading.copyWith(
                        color: Color(AppColors.successColor),
                      ),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      "Description",
                      style: AppTextStyles.semiheading.copyWith(
                        color: AppColors.darkBlueColor,
                        fontSize: 18,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      course.desc,
                      style: AppTextStyles.hintStyle.copyWith(
                        color: AppColors.darkGray,
                      ),
                    ),
                    Spacer(),
                    state is CourseDetailsLoading || state is CourseDetailsInitial
                        ? Center(
                            child: CircularProgressIndicator(
                              color: Color(AppColors.secondaryColor),
                            ),
                          )
                        : CustomButton(
                            onPressed: () {
                              if (state is CourseDetailsInitial ||
                                  state is CourseDetailsError ||
                                  state is NotEnrolled) {
                                context
                                    .read<CourseDetailsCubit>()
                                    .enrollmentsCourse(
                                      courseId: course.id,
                                      userId: Supabase
                                          .instance
                                          .client
                                          .auth
                                          .currentUser!
                                          .id,
                                    );
                              }
                            },
                            text:
                                state is CourseDetailsLoaded ||
                                    state is AlreadyEnrolled
                                ? "Enrolled"
                                : "Enroll Course",
                          ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
