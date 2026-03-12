import 'package:cs_academy/core/constants/app_colors.dart';
import 'package:cs_academy/core/theme/text_styles.dart';
import 'package:cs_academy/core/widgets/functions.dart';
import 'package:cs_academy/features/home/data/repos/home_repo.dart';
import 'package:cs_academy/features/home/presentation/cubit/home_cubit.dart';
import 'package:cs_academy/features/home/presentation/widgets/custom_course_card.dart';
import 'package:cs_academy/features/home/presentation/widgets/custom_top_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit(homeRepo: HomeRepo())..getCourses(),
      child: BlocConsumer<HomeCubit, HomeState>(
        listener: (context, state) {
          if (state is HomeError) {
            snackBar(
              text: state.errorMessage,
              context: context,
              color: Color(AppColors.errorColor),
            );
          }
        },
        builder: (context, state) {
          return Scaffold(
            backgroundColor: AppColors.lightBlueColor,
            body: SafeArea(
  child: Column(
    children: [

      if (state is HomeLoading)
        Center(
          child: CircularProgressIndicator(
            color: Color(AppColors.secondaryColor),
          ),
        ),

      if (state is HomeLoaded) ...[
        CustomTopContainer(
          text: "Hello, ${state.user['name']} ",
        ),

        const SizedBox(height: 16),

        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 3,
            ),
            child: state.courses.isEmpty
                ? Center(
                    child: Text(
                      'Not Found Yet',
                      style: AppTextStyles.s14w600,
                    ),
                  )
                : GridView.builder(
                    itemCount: state.courses.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 1,
                      crossAxisSpacing: 3,
                      childAspectRatio: 4 / 5,
                    ),
                    itemBuilder: (context, index) {
                      final course = state.courses[index];

                      return CustomCouseCard(
                        title: course.title,
                        imag: course.img,
                        desc: course.desc,
                        price: course.price,
                        arguments: course,
                      );
                    },
                  ),
          ),
        ),
      ]
    ],
  ),
), );
        },
      ),
    );
  }
}
