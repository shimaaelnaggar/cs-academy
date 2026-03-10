import 'package:cs_academy/core/constants/app_colors.dart';
import 'package:cs_academy/core/constants/app_strings.dart';
import 'package:cs_academy/core/routing/routes.dart';
import 'package:cs_academy/core/theme/text_styles.dart';
import 'package:cs_academy/core/widgets/functions.dart';
import 'package:cs_academy/features/auth/data/repos/auth_repo.dart';
import 'package:cs_academy/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:cs_academy/core/widgets/custom_button.dart';
import 'package:cs_academy/features/auth/presentation/widgets/custom_text.dart';
import 'package:cs_academy/features/auth/presentation/widgets/custom_text_button.dart';
import 'package:cs_academy/core/widgets/custom_text_form_field.dart';
import 'package:cs_academy/features/auth/presentation/widgets/custom_top_container.dart';
import 'package:cs_academy/features/auth/presentation/widgets/social_media_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  late TextEditingController emailController;
  late TextEditingController passwordController;
  final _formKey = GlobalKey<FormState>();
  bool obscurePassword = true;

  @override
  initState() {
    super.initState();
    emailController = TextEditingController();
    passwordController = TextEditingController();
  }

  @override
  dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit(AuthRepo()),
      child: BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is LoginErrorState) {
            snackBar(
              text: state.errorMessage,
              context: context,
              color: Color(AppColors.errorColor),
            );
          } else if (state is LoginSuccessState) {
            snackBar(
              text: 'Login successful',
              context: context,
              color: Color(AppColors.successColor),
            );
             Navigator.pushReplacementNamed(context, Routes.layout);
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
                      CustomTopContainer(title: AppStrings.login),
                      SizedBox(height: 50),
                      Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
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
                              suffixIcon: obscurePassword
                                  ? IconButton(
                                      icon: Icon(
                                        Icons.visibility_off,
                                        color: AppColors.icnosColor,
                                      ),
                                      onPressed: () {
                                        setState(() {
                                          obscurePassword = false;
                                        });
                                      },
                                    )
                                  : IconButton(
                                      icon: Icon(
                                        Icons.visibility,
                                        color: AppColors.icnosColor,
                                      ),
                                      onPressed: () {
                                        setState(() {
                                          obscurePassword = true;
                                        });
                                      },
                                    ),

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
                            state is LoginLoadingState
                                ? Center(
                                    child: CircularProgressIndicator(
                                      color: Color(AppColors.secondaryColor),
                                    ),
                                  )
                                : CustomButton(
                                    onPressed: () {
                                      if (_formKey.currentState!.validate()) {
                                        context.read<AuthCubit>().signIn(
                                          email: emailController.text.trim(),
                                          password: passwordController.text
                                              .trim(),
                                        );
                                      }
                                     
                                    },
                                    text: AppStrings.login,
                                  ),
                            SizedBox(height: 20),
                            SocialMediaIcons(),
                            SizedBox(height: 20),
                            CustomTextButton(
                              text: "Don't have an account?",
                              buttonText: 'Sign Up',
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
