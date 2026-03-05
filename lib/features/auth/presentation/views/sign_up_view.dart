import 'package:cs_academy/core/constants/app_colors.dart';
import 'package:cs_academy/core/constants/app_strings.dart';
import 'package:cs_academy/features/auth/presentation/widgets/custom_button.dart';
import 'package:cs_academy/features/auth/presentation/widgets/custom_text.dart';
import 'package:cs_academy/features/auth/presentation/widgets/custom_text_button.dart';
import 'package:cs_academy/features/auth/presentation/widgets/custom_text_form_field.dart';
import 'package:cs_academy/features/auth/presentation/widgets/custom_top_container.dart';
import 'package:cs_academy/features/auth/presentation/widgets/social_media_icons.dart';
import 'package:flutter/material.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              CustomTopContainer(title: AppStrings.signUp),
              SizedBox(height: 50),
              Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(text: 'Full Name'),
                    CustomTextFormField(
                      hint: 'Enter your full name',
                      keyboardType: TextInputType.name,
                      prefixIcon: Icon(
                        Icons.person,
                        color: AppColors.icnosColor,
                      ),
                      textInputAction: TextInputAction.next,
                    ),
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
                    CustomButton(onPressed: () {}, text: AppStrings.signUp),
                    SizedBox(height: 20),
                    SocialMediaIcons(),
                    SizedBox(height: 20),
                    CustomTextButton(
                      text: "Already have an account?",
                      buttonText: 'Login',
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
