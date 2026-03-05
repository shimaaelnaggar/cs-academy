import 'package:cs_academy/core/constants/app_colors.dart';
import 'package:cs_academy/core/constants/app_images.dart';
import 'package:cs_academy/core/constants/app_strings.dart';
import 'package:cs_academy/core/theme/text_styles.dart';
import 'package:flutter/material.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );
    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(_controller);
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(AppColors.splashbackgroundColor),
      body: SafeArea(
        child: Center(
          child: FadeTransition(
            opacity: _fadeAnimation,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(AppImages.logo, width: 150, height: 150),

                const SizedBox(height: 20),

                Text(
                  AppStrings.appName,
                  style: TextStyle(
                    fontSize: 42,
                    fontWeight: FontWeight.bold,
                    color: Color(AppColors.appNameColor),
                  ),
                ),

                const SizedBox(height: 10),

                Text(
                  AppStrings.appTagline,
                  style: AppTextStyles.regular.copyWith(
                    color: Color(AppColors.primaryColor),
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
