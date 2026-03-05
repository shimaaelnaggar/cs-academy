import 'package:cs_academy/core/constants/app_colors.dart';
import 'package:cs_academy/core/constants/app_strings.dart';
import 'package:cs_academy/core/theme/text_styles.dart';
import 'package:flutter/material.dart';

class CustomTopContainer extends StatelessWidget {
  const CustomTopContainer({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.25,
      decoration: const BoxDecoration(
        color: Color(AppColors.secondaryColor),
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(50)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(AppStrings.appName, style: AppTextStyles.heading),
          const SizedBox(height: 10),
          Text(
            title,
            style: AppTextStyles.semiheading,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
