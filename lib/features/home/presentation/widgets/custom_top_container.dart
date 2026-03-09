import 'package:cs_academy/core/constants/app_colors.dart';
import 'package:cs_academy/core/constants/app_strings.dart';
import 'package:cs_academy/core/theme/text_styles.dart';
import 'package:cs_academy/core/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';

class CustomTopContainer extends StatelessWidget {
  const CustomTopContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: MediaQuery.sizeOf(context).height * 0.25,
      decoration: BoxDecoration(
        color: Color(AppColors.secondaryColor),
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(20)),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 3),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
             SizedBox(height: 16),
            Text(
              'data',
              style: AppTextStyles.semiheading.copyWith(fontSize: 18),
            ),
            SizedBox(height: 6),
            Text(
              AppStrings.appGreeting ,
              style: AppTextStyles.semiheading.copyWith(fontSize: 20),
            ),
            CustomTextFormField(
              hint: 'What are You Looking For?',
              hintStyle: AppTextStyles.hintStyle.copyWith(
                color: Color(0xff9CA3AF),
              ),
              prefixIcon: Icon(Icons.search_rounded, color: Color(0xff9CA3AF)),
              // cursorColor: Color(AppColors.primaryColor),
              // inputColor: Color(AppColors.primaryColor),
              filledColor: true,
            ),
          ],
        ),
      ),
    );
  }
}
