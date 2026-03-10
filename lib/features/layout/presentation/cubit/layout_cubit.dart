import 'package:cs_academy/features/home/presentation/views/home.dart';
import 'package:cs_academy/features/subscribed_courses/presentation/views/subscribed_courses.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'layout_state.dart';

class LayoutCubit extends Cubit<LayoutState> {
  LayoutCubit() : super(LayoutInitial());

  List<Widget> views = [
    const Home(),
    const SubscribedCourses(),
    const Center(child: Text('Profile Screen')),
  ];

  int currentIndex = 0;

  void changeBottomNavBar(int index) {
    currentIndex = index;
    emit(ChangeBottomNavBarState());
  }
}
