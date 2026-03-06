import 'package:cs_academy/core/constants/app_colors.dart';
import 'package:cs_academy/core/constants/app_strings.dart';
import 'package:cs_academy/core/routing/routes.dart';
import 'package:cs_academy/core/widgets/functions.dart';
import 'package:cs_academy/features/auth/data/repos/auth_repo.dart';
import 'package:cs_academy/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:cs_academy/features/auth/presentation/widgets/custom_button.dart';
import 'package:cs_academy/features/auth/presentation/widgets/custom_text.dart';
import 'package:cs_academy/features/auth/presentation/widgets/custom_text_button.dart';
import 'package:cs_academy/features/auth/presentation/widgets/custom_text_form_field.dart';
import 'package:cs_academy/features/auth/presentation/widgets/custom_top_container.dart';
import 'package:cs_academy/features/auth/presentation/widgets/social_media_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({super.key});

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  late TextEditingController emailController;
  late TextEditingController passwordController;
  late TextEditingController fullNameController;
  final _formKey = GlobalKey<FormState>();
  bool obscurePassword = true;

  @override
  void initState() {
    super.initState();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    fullNameController = TextEditingController();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    fullNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit(AuthRepo()),
      child: BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is SignUpErrorState) {
            snackBar(
              text: state.errorMessage,
              context: context,
              color: Color(AppColors.errorColor),
            );
          } else if (state is SignUpSuccessState) {
            snackBar(
              text: 'Sign Up successful',
              context: context,
              color: Color(AppColors.successColor),
            );
          }
        },
        builder: (context, state) {
          return Scaffold(
            body: SafeArea(
              child: SingleChildScrollView(
                child: Form(
                  key: _formKey,
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
                              controller: fullNameController,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter your full name';
                                }
                                return null;
                              },
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
                              controller: emailController,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter your email';
                                }
                                if (!RegExp(
                                  r'^[^@]+@[^@]+\.[^@]+',
                                ).hasMatch(value)) {
                                  return 'Please enter a valid email';
                                }
                                return null;
                              },
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
                              controller: passwordController,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter your password';
                                }
                                if (value.length < 6) {
                                  return 'Password must be at least 6 characters';
                                }
                                return null;
                              },
                              hint: 'Enter your password',
                              obscureText: true,
                              keyboardType: TextInputType.visiblePassword,
                              suffixIcon: IconButton(
                                onPressed: () {
                                  setState(() {
                                    obscurePassword = !obscurePassword;
                                  });
                                },
                                icon: Icon(
                                  Icons.visibility_off,
                                  color: AppColors.icnosColor,
                                ),
                              ),
                              prefixIcon: Icon(
                                Icons.lock,
                                color: AppColors.icnosColor,
                              ),
                              textInputAction: TextInputAction.done,
                            ),
                            SizedBox(height: 20),
                            state is SignUpErrorState
                                ? Center(
                                    child: CircularProgressIndicator(
                                      color: Color(AppColors.primaryColor),
                                    ),
                                  )
                                : CustomButton(
                                    onPressed: () {
                                      if (_formKey.currentState!.validate()) {
                                        context.read<AuthCubit>().signUp(
                                          name: fullNameController.text.trim(),
                                          email: emailController.text.trim(),
                                          password: passwordController.text
                                              .trim(),
                                        );
                                      }
                                      Navigator.pushNamed(
                                        context,
                                        Routes.login,
                                      );
                                    },
                                    text: AppStrings.signUp,
                                  ),
                            SizedBox(height: 20),
                            SocialMediaIcons(),
                            SizedBox(height: 20),
                            CustomTextButton(
                              text: "Already have an account?",
                              buttonText: 'Login',
                              onPressed: () {
                                Navigator.pop(context);
                              },
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
