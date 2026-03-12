import 'package:cs_academy/core/constants/app_colors.dart';
import 'package:cs_academy/core/routing/routes.dart';
import 'package:cs_academy/features/profile/data/repos/profile_repo.dart';
import 'package:cs_academy/features/profile/presentation/cubit/profile_cubit.dart';
import 'package:cs_academy/features/profile/presentation/widgets/custom_info_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cs_academy/core/theme/text_styles.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProfileCubit(ProfileRepo())..getProfile(),
      child: BlocConsumer<ProfileCubit, ProfileState>(
        listener: (context, state) {
          if (state is LogoutSuccess) {
            Navigator.pushNamedAndRemoveUntil(
              context,
              Routes.login,
              (route) => false,
            );
          }
        },
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              automaticallyImplyLeading: false,
              title: Text(
                "Profile",
                style: AppTextStyles.semiheading.copyWith(fontSize: 20),
              ),
              centerTitle: true,
              backgroundColor: const Color(AppColors.secondaryColor),
            ),
            body: state is ProfileLoading
                ? Center(
                    child: CircularProgressIndicator(
                      color: Color(AppColors.secondaryColor),
                    ),
                  )
                : state is ProfileLoaded
                ? Padding(
                    padding: const EdgeInsets.all(16),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          SizedBox(
                            width: double.infinity,
                            child: Card(
                              color: Color(AppColors.primaryColor),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Column(
                                  children: [
                                    CircleAvatar(
                                      radius: 40,
                                      backgroundColor: AppColors.lightBlueColor,
                                      child: Icon(Icons.person, size: 40),
                                    ),

                                    const SizedBox(height: 10),

                                    Text(
                                      state.data['name'] ?? "",
                                      style: AppTextStyles.semiheading.copyWith(
                                        color: Color(0xff0F172A),
                                      ),
                                    ),

                                    const SizedBox(height: 6),

                                    Text(
                                      state.data['email'] ?? "",
                                      style: AppTextStyles.s14regular,
                                    ),

                                    const SizedBox(height: 6),

                                    Container(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 12,
                                        vertical: 4,
                                      ),
                                      decoration: BoxDecoration(
                                        color: AppColors.lightBlueColor,
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      child: Text(
                                        "Premium Member",
                                        style: AppTextStyles.s14w600.copyWith(
                                          color: Color(
                                            AppColors.secondaryColor,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),

                          const SizedBox(height: 30),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                'Account Settings',
                                style: AppTextStyles.s12Bold,
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                          CustomInfoList(
                            icon: Icons.person,
                            text: "Edit Profile",
                            onTap: () async {
                              await Navigator.pushNamed(
                                context,
                                Routes.editProfile,
                              );

                              context.read<ProfileCubit>().getProfile();
                            },
                          ),
                          const SizedBox(height: 20),
                          CustomInfoList(
                            icon: Icons.lock,
                            text: "Change Password",
                          ),

                          const SizedBox(height: 20),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text('Learning', style: AppTextStyles.s12Bold),
                            ],
                          ),
                          const SizedBox(height: 10),
                          CustomInfoList(
                            icon: Icons.workspace_premium,
                            text: "My Certificates",
                          ),
                          const SizedBox(height: 20),
                          CustomInfoList(
                            icon: Icons.receipt_long,
                            text: "Purchase History",
                          ),

                          SizedBox(height: 30),

                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: AppColors.lightBlueColor,
                              ),
                              onPressed: () {
                                context.read<ProfileCubit>().logout();
                              },
                              child: const Text(
                                "Log Out",
                                style: TextStyle(color: Colors.red),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                : SizedBox(),
          );
        },
      ),
    );
  }
}
