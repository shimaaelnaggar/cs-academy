import 'package:cs_academy/core/constants/app_colors.dart';
import 'package:cs_academy/core/constants/app_strings.dart';
import 'package:cs_academy/core/theme/text_styles.dart';
import 'package:cs_academy/features/auth/presentation/widgets/custom_button.dart';
import 'package:cs_academy/features/auth/presentation/widgets/custom_text.dart';
import 'package:cs_academy/features/auth/presentation/widgets/custom_text_button.dart';
import 'package:cs_academy/features/auth/presentation/widgets/custom_text_form_field.dart';
import 'package:cs_academy/features/auth/presentation/widgets/custom_top_container.dart';
import 'package:cs_academy/features/auth/presentation/widgets/social_media_icons.dart';
import 'package:flutter/material.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              CustomTopContainer(title: AppStrings.login),
              SizedBox(height: 50),
              Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(text: AppStrings.email),
                    CustomTextFormField(
                      hint: 'Enter your email',
                      keyboardType: TextInputType.emailAddress,
                      prefixIcon: Icon(
                        Icons.email,
                        color: AppColors.icnosColor,
                      ),
                      textInputAction: TextInputAction.next,
                    ),
                    SizedBox(height: 20),
                    CustomText(text: AppStrings.password),
                    CustomTextFormField(
                      hint: 'Enter your password',
                      obscureText: true,
                      keyboardType: TextInputType.visiblePassword,
                      suffixIcon: Icon(
                        Icons.visibility_off,
                        color: AppColors.icnosColor,
                      ),
                      prefixIcon: Icon(Icons.lock, color: AppColors.icnosColor),
                      textInputAction: TextInputAction.done,
                    ),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          'Forgot Password?',
                          style: AppTextStyles.regular.copyWith(
                            color: Color(0xff9CA3AF),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    CustomButton(onPressed: () {}, text: AppStrings.login),
                    SizedBox(height: 20),
                    SocialMediaIcons(),
                    SizedBox(height: 20),
                    CustomTextButton(
                      text: "Don't have an account?",
                      buttonText: 'Sign Up',
                      onPressed: () {},
                    ),
                      ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
