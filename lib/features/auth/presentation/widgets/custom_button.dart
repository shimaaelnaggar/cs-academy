import 'package:cs_academy/core/constants/app_colors.dart';
import 'package:cs_academy/core/theme/text_styles.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String text;
  const CustomButton({super.key, required this.onPressed, required this.text});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 40,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: Color(AppColors.secondaryColor),
          foregroundColor: AppColors.icnosColor,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        ),
        child: Text(
          text,
          style: AppTextStyles.semiheading.copyWith(fontSize: 18),
        ),
      ),
    );
  }
}
