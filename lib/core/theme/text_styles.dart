import 'package:cs_academy/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

class AppTextStyles {
  static final TextStyle heading = TextStyle(
    fontSize: 30,
    fontWeight: FontWeight.bold,
    color: Color(AppColors.appNameColor),
  );
  static final TextStyle semiheading = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: Color(AppColors.primaryColor),
  );
  static final TextStyle s14w600 = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    color: Color(AppColors.bodyTextColor),
  );
  static final TextStyle s18bold = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.bold,
    color: AppColors.navyBlue,
  );

  static final TextStyle regular = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.normal,
  );

  static final TextStyle hintStyle = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.normal,
    color: Color(0xff6B7280),
  );

  static final TextStyle s14bold = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.bold,
    color: Color(0xff1F2937),
  );

   static final TextStyle s14regular = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.normal,
    color: Color(0xff64748B),
  );

   static final TextStyle s12Bold = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.bold,
    color: Color(0xff64748B),
  );

   static final TextStyle s16Meduim = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    color: Color(0xff0F172A),
  );
}
