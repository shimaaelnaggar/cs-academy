import 'package:cs_academy/core/constants/app_colors.dart';
import 'package:cs_academy/features/layout/presentation/cubit/layout_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LayoutBottomNavBarView extends StatelessWidget {
  const LayoutBottomNavBarView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LayoutCubit(),
      child: BlocBuilder<LayoutCubit, LayoutState>(
        builder: (context, state) {
          return Scaffold(
            body: context
                .read<LayoutCubit>()
                .views[context.read<LayoutCubit>().currentIndex],
            bottomNavigationBar: ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
              child: BottomNavigationBar(
                currentIndex: context.read<LayoutCubit>().currentIndex,
                onTap: (index) {
                  context.read<LayoutCubit>().changeBottomNavBar(index);
                },
                items: const [
                  BottomNavigationBarItem(
                    icon: Icon(Icons.home),
                    label: 'Home',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.book),
                    label: 'My Courses',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.person),
                    label: 'Profile',
                  ),
                ],
                selectedItemColor: Color(AppColors.primaryColor),
                unselectedItemColor: const Color.fromARGB(255, 202, 199, 199),
                selectedIconTheme: const IconThemeData(size: 28),
                unselectedIconTheme: const IconThemeData(size: 24),
                selectedLabelStyle: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
                unselectedLabelStyle: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                ),
                type: BottomNavigationBarType.fixed,
                backgroundColor: Color(AppColors.secondaryColor),
              ),
            ),
          );
        },
      ),
    );
  }
}
